#!/bin/bash

# Script to preview the Quarto website locally using Docker
# No need to install R or Quarto on your machine

echo "Building Docker image for Quarto preview..."
docker-compose build

echo "Starting Quarto preview server..."
docker-compose up

# The site will be available at http://localhost:4000