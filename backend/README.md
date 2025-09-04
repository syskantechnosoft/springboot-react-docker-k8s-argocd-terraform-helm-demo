# User CRUD Backend

This is the Spring Boot backend for the User CRUD application.

## Prerequisites

- JDK 21
- Maven 3.6+
- Docker (for containerized deployment)

## Local Development

### Running with Maven

1. Navigate to the backend directory:
   ```bash
   cd backend
   ```

2. Run the application:
   ```bash
   mvn spring-boot:run
   ```

3. The application will start on http://localhost:8080

### Running with Docker

1. Build the Docker image:
   ```bash
   docker build -t user-crud-backend .
   ```

2. Run the container:
   ```bash
   docker run -p 8080:8080 user-crud-backend
   ```

## API Endpoints

- `GET /api/users` - Get all users
- `GET /api/users/{id}` - Get user by ID
- `POST /api/users` - Create a new user
- `PUT /api/users/{id}` - Update a user
- `DELETE /api/users/{id}` - Delete a user

## Database

The application uses H2 in-memory database with initial data loaded from `schema.sql` and `data.sql`.

## Deployment to GCP

### Using Kubernetes

1. Build and push Docker image to Google Container Registry:
   ```bash
   gcloud builds submit --tag gcr.io/YOUR_PROJECT_ID/user-crud-backend .
   ```

2. Update the Helm values with your image:
   ```yaml
   image:
     repository: gcr.io/YOUR_PROJECT_ID/user-crud-backend
     tag: latest
   ```

3. Deploy using Helm:
   ```bash
   helm install user-crud-backend ./helm/backend
   ```

### Using Cloud Run

1. Build and push Docker image to Google Container Registry:
   ```bash
   gcloud builds submit --tag gcr.io/YOUR_PROJECT_ID/user-crud-backend .
   ```

2. Deploy to Cloud Run:
   ```bash
   gcloud run deploy user-crud-backend \
     --image gcr.io/YOUR_PROJECT_ID/user-crud-backend \
     --platform managed \
     --port 8080 \
     --allow-unauthenticated
   ```

## Configuration

The application can be configured using environment variables or `application.properties`:

- `SPRING_PROFILES_ACTIVE` - Active Spring profile
- `SPRING_DATASOURCE_URL` - Database URL
- `SPRING_DATASOURCE_USERNAME` - Database username
- `SPRING_DATASOURCE_PASSWORD` - Database password