gcm docker -ea SilentlyContinue | Out-Null
if ($? -eq $false) {
  Write-Output "docker���C���X�g�[�����Ă��������B"
  pause
  exit
}

docker image build java/. -t javadevelopment
docker image build postgresql/. -t postgresql

docker network create -d ics app_network
