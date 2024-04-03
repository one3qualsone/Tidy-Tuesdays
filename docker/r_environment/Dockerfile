# Use an official R base image
FROM rocker/r-ver:4.1.0

# Install system dependencies
RUN apt-get update && apt-get install -y \
    libcurl4-gnutls-dev \
    libssl-dev \
    libxml2-dev \
    libpq-dev \
    libssh2-1-dev \
    && rm -rf /var/lib/apt/lists/*

# Copy the R package list into the Docker image
COPY requirements.R /tmp/requirements.R

# Install R packages from the requirements file
RUN Rscript /tmp/requirements.R

# Set the working directory
WORKDIR /usr/src/app

# Optional: specify a default command or entry point
# CMD ["R", "-e", "shiny::runApp('/path/to/your/app')"]
