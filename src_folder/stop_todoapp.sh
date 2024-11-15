#!/bin/bash

# Set variables
CONTAINER_NAME="todoapp_container"

# Step 1: Stop the running container
echo "Stopping the container..."
docker stop $CONTAINER_NAME

# Step 2: Remove the container
echo "Removing the container..."
docker rm $CONTAINER_NAME

# Step 3: Confirm the container is removed
if [ $(docker ps -a | grep $CONTAINER_NAME) ]; then
  echo "Failed to remove the container."
else
  echo "Container removed successfully."
fi