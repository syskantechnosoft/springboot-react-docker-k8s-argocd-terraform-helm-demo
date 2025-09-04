# User CRUD Frontend

This is the React frontend for the User CRUD application.

## Prerequisites

- Node.js 18+
- npm or yarn

## Local Development

1. Navigate to the frontend directory:
   ```bash
   cd frontend
   ```

2. Install dependencies:
   ```bash
   npm install
   ```

3. Start the development server:
   ```bash
   npm run dev
   ```

4. The application will be available at http://localhost:5173

## Building for Production

1. Build the application:
   ```bash
   npm run build
   ```

2. The built files will be in the `dist` directory

## Running with Docker

1. Build the Docker image:
   ```bash
   docker build -t user-crud-frontend .
   ```

2. Run the container:
   ```bash
   docker run -p 3000:3000 user-crud-frontend
   ```

## Features

- Display all users in a table
- Add new users
- Edit existing users
- Delete users
- Search users by name, email, or mobile
- Sort users by name, email, or date of birth
- Responsive design

## API Integration

The frontend communicates with the backend API at `http://localhost:8080/api/users`. Make sure the backend is running before using the frontend.

## Deployment to GCP

### Using Kubernetes

1. Build and push Docker image to Google Container Registry:
   ```bash
   gcloud builds submit --tag gcr.io/YOUR_PROJECT_ID/user-crud-frontend .
   ```

2. Update the Helm values with your image:
   ```yaml
   image:
     repository: gcr.io/YOUR_PROJECT_ID/user-crud-frontend
     tag: latest
   ```

3. Deploy using Helm:
   ```bash
   helm install user-crud-frontend ./helm/frontend
   ```

### Using Firebase Hosting

1. Install Firebase CLI:
   ```bash
   npm install -g firebase-tools
   ```

2. Login to Firebase:
   ```bash
   firebase login
   ```

3. Initialize Firebase in your project:
   ```bash
   firebase init hosting
   ```

4. Build the application and deploy:
   ```bash
   npm run build
   firebase deploy
   ```

## Environment Variables

Create a `.env` file in the root directory for environment-specific configurations:

```
VITE_API_BASE_URL=http://localhost:8080/api
```

## Technologies Used

- React 18
- Vite
- Axios for API calls
- CSS for styling
