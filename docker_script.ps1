$Timestamp = Get-Date -Format "yyyyMMddHHmmss"

$AdminApp = "ampregistry:5000/admin_frontend:$Timestamp"

Write-Host $AdminApp

docker build -f .\Dockerfile -t $AdminApp .
docker push $AdminApp