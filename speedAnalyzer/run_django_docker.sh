#!/bin/bash

# Project variables
IMAGE_NAME="speed_analyzer_image"
CONTAINER_NAME="speed_analyzer_container"
HOST_PORT=8000
CONTAINER_PORT=8000

# Step 1: Build the Docker image
echo "🚧 Building Docker image..."
docker build -t $IMAGE_NAME .

# Step 2: Stop and remove existing container (if any)
echo "🧹 Cleaning up old container (if exists)..."
docker stop $CONTAINER_NAME 2>/dev/null
docker rm $CONTAINER_NAME 2>/dev/null

# Step 3: Run the container
echo "🚀 Starting Django container..."
docker run -d \
  --name $CONTAINER_NAME \
  -p $HOST_PORT:$CONTAINER_PORT \
  $IMAGE_NAME

# Optional: Show logs
echo "📜 Showing logs (press Ctrl+C to stop)..."
docker logs -f $CONTAINER_NAME
