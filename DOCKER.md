# Docker images and push instructions

This repo includes `Dockerfile`s for both the backend and frontend and a helper PowerShell script to build and push images to Docker Hub.

- Backend Dockerfile: `backend/Dockerfile` (Node 18 image, exposes port `8080`).
- Frontend Dockerfile: `frontend/Dockerfile` (multi-stage build, serves production build with Nginx on port `80`).
- Compose: `docker-compose.yml` for local testing (maps `8080` and `80`).
 - Compose: `docker-compose.yml` for local testing. Host ports are configurable via env vars; frontend defaults to host port `8081`.

Build and push images (PowerShell):

1. Log in to Docker Hub:

```powershell
docker login
```

2. Run the provided script (replace `your-dockerhub-username` or set `DOCKERHUB_USER` env var):

```powershell
.\scripts\build-and-push.ps1 your-dockerhub-username
```

Or set an environment variable then run the script:

```powershell
$env:DOCKERHUB_USER = 'your-dockerhub-username'; .\scripts\build-and-push.ps1
```

Note: The script builds and tags images as `your-dockerhub-username/backend:latest` and `your-dockerhub-username/frontend:latest` and pushes them to Docker Hub. Ensure you have Docker installed and are logged in.

Run docker-compose (defaults)

```powershell
docker-compose up --build
# backend -> http://localhost:5000
# frontend -> http://localhost:8081
```

Override host ports (PowerShell example)

```powershell
# Temporarily set host ports for this shell session then start compose
$env:BACKEND_PORT = '5000'
$env:FRONTEND_PORT = '4200'
docker-compose up --build
# backend -> http://localhost:5000
# frontend -> http://localhost:4200
```
