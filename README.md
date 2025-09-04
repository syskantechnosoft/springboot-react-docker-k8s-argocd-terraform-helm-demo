# User CRUD Application

A full-stack web application for managing user data with CRUD operations, built using Spring Boot and React.

## Architecture

- **Backend**: Spring Boot 3.5.5 with Java 21, H2 database, REST API
- **Frontend**: React with Vite, Axios for API calls
- **Database**: H2 in-memory database with initial schema and data
- **Containerization**: Docker and Docker Compose
- **CI/CD**: GitHub Actions
- **Deployment**: Kubernetes with Helm, Argo CD
- **Infrastructure**: Terraform for local setup

## Project Structure

```
.
├── backend/                 # Spring Boot application
│   ├── src/
│   ├── Dockerfile
│   ├── pom.xml
│   └── README.md
├── frontend/                # React application
│   ├── src/
│   ├── Dockerfile
│   ├── package.json
│   └── README.md
├── helm/                    # Helm charts
│   ├── backend/
│   └── frontend/
├── argocd/                  # Argo CD configuration
├── terraform/               # Terraform scripts
├── .github/workflows/       # GitHub Actions
├── docker-compose.yml       # Docker Compose configuration
└── README.md
```

## Prerequisites

- JDK 21
- Node.js 18+
- Docker and Docker Compose
- Maven 3.6+
- Git
- kubectl (for Kubernetes deployment)
- Helm (for Kubernetes deployment)
- Terraform (for infrastructure)

## Quick Start

### Local Development with Docker Compose

1. Clone the repository:
   ```bash
   git clone <repository-url>
   cd user-crud-app
   ```

2. Start the application:
   ```bash
   docker-compose up --build
   ```

3. Access the application:
   - Frontend: http://localhost:5173
   - Backend API: http://localhost:8080
   - H2 Console: http://localhost:8080/h2-console

### Manual Local Development

1. Start the backend:
   ```bash
   cd backend
   mvn spring-boot:run
   ```

2. Start the frontend:
   ```bash
   cd frontend
   npm install
   npm run dev
   ```

## API Documentation

### Endpoints

- `GET /api/users` - Retrieve all users
- `GET /api/users/{id}` - Retrieve user by ID
- `POST /api/users` - Create a new user
- `PUT /api/users/{id}` - Update an existing user
- `DELETE /api/users/{id}` - Delete a user

### User Model

```json
{
  "id": 1,
  "name": "John Doe",
  "email": "john.doe@example.com",
  "mobile": "1234567890",
  "dateOfBirth": "1990-01-01"
}
```

## Features

- ✅ Complete CRUD operations for users
- ✅ Search functionality (name, email, mobile)
- ✅ Sort by name, email, or date of birth
- ✅ Responsive UI
- ✅ RESTful API
- ✅ H2 database with sample data
- ✅ Docker containerization
- ✅ CI/CD with GitHub Actions
- ✅ Kubernetes deployment with Helm
- ✅ Argo CD for continuous deployment
- ✅ Terraform for infrastructure

## Deployment

### Local Deployment

#### Using Docker Compose
```bash
docker-compose up --build
```

#### Using Terraform
```bash
cd terraform
terraform init
terraform apply
```

### Cloud Deployment (GCP)

#### Prerequisites
- Google Cloud SDK
- kubectl configured for GKE
- Argo CD installed in cluster

#### Steps

1. **Build and Push Images**:
   ```bash
   # Backend
   cd backend
   gcloud builds submit --tag gcr.io/YOUR_PROJECT_ID/user-crud-backend .

   # Frontend
   cd frontend
   gcloud builds submit --tag gcr.io/YOUR_PROJECT_ID/user-crud-frontend .
   ```

2. **Update Helm Values**:
   Update `helm/backend/values.yaml` and `helm/frontend/values.yaml` with your GCR image paths.

3. **Deploy with Helm**:
   ```bash
   helm install user-crud-backend ./helm/backend
   helm install user-crud-frontend ./helm/frontend
   ```

4. **Set up Argo CD**:
   ```bash
   kubectl apply -f argocd/application.yaml
   ```

## CI/CD Pipeline

The GitHub Actions workflow includes:
- Backend testing with Maven
- Frontend build verification
- Docker image building and pushing
- Automated deployment triggers

## Monitoring and Logging

- Spring Boot Actuator endpoints available at `/actuator`
- Application logs available in Docker containers
- Kubernetes logs accessible via `kubectl logs`

## Security Considerations

- CORS enabled for frontend-backend communication
- Input validation on both frontend and backend
- H2 console disabled in production (use external database)

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Run tests
5. Submit a pull request

## License

This project is licensed under the MIT License.