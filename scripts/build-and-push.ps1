param(
    [string]$Username
)

if (-not $Username) {
    $Username = $env:DOCKERHUB_USER
}

if (-not $Username) {
    Write-Error "Docker Hub username not provided. Pass as parameter or set env var DOCKERHUB_USER."
    exit 1
}

Write-Output "Make sure you are logged in: `docker login`"
Write-Output "Building backend image..."
docker build -t $Username/backend:latest ./backend
if ($LASTEXITCODE -ne 0) { Write-Error "Backend build failed"; exit 1 }

Write-Output "Pushing backend image..."
docker push $Username/backend:latest
if ($LASTEXITCODE -ne 0) { Write-Error "Backend push failed"; exit 1 }

Write-Output "Building frontend image..."
docker build -t $Username/frontend:latest ./frontend
if ($LASTEXITCODE -ne 0) { Write-Error "Frontend build failed"; exit 1 }

Write-Output "Pushing frontend image..."
docker push $Username/frontend:latest
if ($LASTEXITCODE -ne 0) { Write-Error "Frontend push failed"; exit 1 }

Write-Output "All done. Images pushed to $Username on Docker Hub."
