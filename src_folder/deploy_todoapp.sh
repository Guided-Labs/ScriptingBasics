#!/bin/bash

# Set variables
IMAGE_NAME="todoapp_image"
CONTAINER_NAME="todoapp_container"
PORT="8081:8081"

echo "Starting the automated deployment of TodoApp..."

# Step 1: Stop and remove any old running container
if [ $(docker ps -a -q -f name=$CONTAINER_NAME) ]; then
    echo "Stopping and removing existing container: $CONTAINER_NAME..."
    docker stop $CONTAINER_NAME
    docker rm $CONTAINER_NAME
fi

# Step 2: Build Docker image
echo "Building Docker image: $IMAGE_NAME..."
docker build -t $IMAGE_NAME .

# Step 3: Run Docker container
echo "Running Docker container: $CONTAINER_NAME..."
docker run -d -p8081:8081 --name todoapp_container --network=todoapp_network -e MYSQL_HOST=mysqldb --restart unless-stopped $IMAGE_NAME

# Step 4: Verify the container is running
if [ $(docker ps -q -f name=$CONTAINER_NAME) ]; then
    echo "TodoApp is running successfully at http://localhost:8081/swagger-ui/index.html"
else
    echo "Failed to start TodoApp. Check the Docker logs for more details."
fi