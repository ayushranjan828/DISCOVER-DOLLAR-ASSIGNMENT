# Discover Dollar Assignment

## 1. Clone the Repository

``` bash
git clone git@github.com:ayushranjan828/DISCOVER-DOLLAR-ASSIGNMENT.git
cd DISCOVER-DOLLAR-ASSIGNMENT
```

## 2. Pull Docker Images from Docker Hub

### Pull Frontend Image

``` bash
docker pull ayushranjan94300/frontend
```

### Pull Backend Image

``` bash
docker pull ayushranjan94300/backend
```

## 3. Run Containers on Docker Desktop / Terminal

### Run Backend

``` bash
docker run -d -p 8080:8080 ayushranjan94300/backend
```

Access in browser:\
http://localhost:8080

### Run Frontend

``` bash
docker run -d -p 8081:80 ayushranjan94300/frontend
```

Access in browser:\
http://localhost:8081

## 4. Docker Images and Push Instructions

This repo includes Dockerfiles for both the backend and frontend and a
helper PowerShell script to build and push images to Docker Hub.

-   Backend Dockerfile: `backend/Dockerfile` (Node 18, port 8080)
-   Frontend Dockerfile: `frontend/Dockerfile` (multi‑stage Nginx build,
    port 80)
-   docker-compose.yml supports configurable host ports (frontend
    defaults to 8081)

### Build & Push Images (PowerShell)

#### 1. Login

``` powershell
docker login
```

#### 2. Run build & push script

``` powershell
.\scriptsuild-and-push.ps1 your-dockerhub-username
```

Or set env variable:

``` powershell
$env:DOCKERHUB_USER = 'your-dockerhub-username'; .\scriptsuild-and-push.ps1
```

### docker-compose default

``` powershell
docker-compose up --build
```

-   Backend → http://localhost:5000\
-   Frontend → http://localhost:8081

### Override Ports

``` powershell
$env:BACKEND_PORT = '5000'
$env:FRONTEND_PORT = '4200'
docker-compose up --build
```

-   Backend → http://localhost:5000\
-   Frontend → http://localhost:4200
