terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

provider "docker" {
  host = "unix:///var/run/docker.sock"
}

# Create a network for the application
resource "docker_network" "user_crud_network" {
  name = "user-crud-network"
}

# Backend service
resource "docker_image" "backend" {
  name = "user-crud-backend:latest"
  build {
    context    = "../backend"
    dockerfile = "Dockerfile"
  }
}

resource "docker_container" "backend" {
  name  = "user-crud-backend"
  image = docker_image.backend.image_id

  ports {
    internal = 8080
    external = 8080
  }

  networks_advanced {
    name = docker_network.user_crud_network.name
  }

  depends_on = [docker_network.user_crud_network]
}

# Frontend service
resource "docker_image" "frontend" {
  name = "user-crud-frontend:latest"
  build {
    context    = "../frontend"
    dockerfile = "Dockerfile"
  }
}

resource "docker_container" "frontend" {
  name  = "user-crud-frontend"
  image = docker_image.frontend.image_id

  ports {
    internal = 5173
    external = 5173
  }

  networks_advanced {
    name = docker_network.user_crud_network.name
  }

  depends_on = [docker_container.backend]
}