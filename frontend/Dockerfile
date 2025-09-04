# Use the official Node.js image as the base image
FROM node:18-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json to the container
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Build the application
RUN npm run build

# Use a lightweight web server to serve the built application
RUN npm install -g serve

# Expose the port the app runs on
EXPOSE 3000

# Serve the application
CMD ["serve", "-s", "dist", "-l", "3000"]