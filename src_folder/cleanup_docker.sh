#!/bin/bash

# Step 1: Remove stopped containers
echo "Removing stopped containers..."
docker container prune -f

# Step 2: Remove unused images
echo "Removing unused images..."
docker image prune -f

# Step 3: Remove unused volumes
echo "Removing unused volumes..."
docker volume prune -f

# Step 4: Remove unused networks
echo "Removing unused networks..."
docker network prune -f

echo "Docker cleanup completed!"