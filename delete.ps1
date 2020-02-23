$line=docker ps | Select-String -Pattern "(postgresql)|(javadevelopment)" | ForEach-Object { $_.Line + "`r`n" + ($_.Context.PostContext -Join "`r`n") }
foreach ($row in $line) {
  Write-Output $row
  if($row.length -le 0){
    continue
  }
  $row -match "^([a-z-A-Z0-9]+)\s+([a-z-A-Z0-9]+)\s+([a-z-A-Z0-9]+)"
  foreach ($image_id in $matches){
    Write-Output $image_id
    docker stop $image_id[0]
    docker rm $image_id[1]
  }
}

$line=docker image ls | Select-String -Pattern "(postgresql)|(javadevelopment)" | ForEach-Object { $_.Line + "`r`n" + ($_.Context.PostContext -Join "`r`n") }
foreach ($row in $line) {
  Write-Output $row
  if($row.length -le 0){
    continue
  }
  $row -match "([a-z-A-Z0-9]+)\s+([a-z-A-Z0-9]+)\s+([a-z-A-Z0-9]+)"
  foreach ($image_id in $matches){
    docker rmi -f $image_id[3]
  }
}

docker network rm app_network
