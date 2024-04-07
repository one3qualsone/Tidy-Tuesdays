FROM ubuntu:latest

# Install dependencies in one layer and clean up
RUN apt-get update && apt-get install -y \
    curl \
    wget \
    dpkg \
    && curl -s https://api.github.com/repos/quarto-dev/quarto-cli/releases/latest \
    | grep "browser_download_url.*linux-amd64.deb" \
    | cut -d '"' -f 4 \
    | wget -qi - \
    && dpkg -i quarto*.deb \
    && rm -rf quarto*.deb /var/lib/apt/lists/*

# Expose the default Quarto serve port
EXPOSE 4000

# Copy your Quarto project files and weekly challenges into the container
# Make sure these directories are within your Docker build context
COPY website/ /quarto-project/website
COPY /weekly_challenges /quarto-project/website/weekly_challenges

# Set the working directory to where your Quarto project is
WORKDIR /quarto-project

# Start the Quarto server
CMD ["quarto", "preview", "--host", "0.0.0.0", "--port", "4000"]