$line=docker image ls | Select-String -Pattern "(javadevelopment)" | ForEach-Object { $_.Line + "`r`n" + ($_.Context.PostContext -Join "`r`n") }
foreach ($row in $line) {
  Write-Output $row
  if($row.length -le 0){
    continue
  }
  $row -match "([a-z-A-Z0-9]+)\s+([a-z-A-Z0-9]+)\s+([a-z-A-Z0-9]+)"
  foreach ($image_id in $matches){
    docker run --net=app_network --name javadevelopment -p 2222:22 -p 8081:8080 -itd $image_id[3]
  }
}

$line=docker image ls | Select-String -Pattern "(postgresql)" | ForEach-Object { $_.Line + "`r`n" + ($_.Context.PostContext -Join "`r`n") }
foreach ($row in $line) {
  Write-Output $row
  if($row.length -le 0){
    continue
  }
  $row -match "([a-z-A-Z0-9]+)\s+([a-z-A-Z0-9]+)\s+([a-z-A-Z0-9]+)"
  foreach ($image_id in $matches){
    docker run --net=app_network --name postgresql -p 5432:5432 -itd $image_id[3]
  }
}

docker ps
