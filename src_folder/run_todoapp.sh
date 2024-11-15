#!/bin/bash

# Set variables
IMAGE_NAME="todoapp_image"
CONTAINER_NAME="todoapp_container"

# Step 1: Build the Docker image
echo "Building the Docker image..."
docker build -t $IMAGE_NAME .

# Step 2: Run the Docker container
echo "Starting the Docker container..."
# docker run -d --name $CONTAINER_NAME -p 8080:8080 $IMAGE_NAME
docker run -d -p8081:8081 --name todoapp_container --network=todoapp_network -e MYSQL_HOST=mysqldb todoapp_image

# Step 3: Check if the container is running
if [ $(docker inspect -f '{{.State.Running}}' $CONTAINER_NAME) == "true" ]; then
  echo "TodoApp is running on http://localhost:8081"
else
  echo "Failed to start the TodoApp container."
fi