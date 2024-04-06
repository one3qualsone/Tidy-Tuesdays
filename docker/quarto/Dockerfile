FROM ubuntu:latest

# Install dependencies
RUN apt-get update && apt-get install -y \
    curl \
    wget \
    dpkg \
    && rm -rf /var/lib/apt/lists/*

# Fetch the latest Quarto release URL, download and install it
RUN curl -s https://api.github.com/repos/quarto-dev/quarto-cli/releases/latest \
    | grep "browser_download_url.*linux-amd64.deb" \
    | cut -d '"' -f 4 \
    | wget -qi - \
    && dpkg -i quarto*.deb \
    && rm quarto*.deb

# Expose the default Quarto serve port
EXPOSE 4000

# Copy your Quarto project files into the container
# Ensure you have a directory named 'your-quarto-project' in your context
COPY website/ /quarto-project

# Set the working directory to where your Quarto project is
WORKDIR /quarto-project

# Start the Quarto server
CMD ["quarto", "preview", "--host", "0.0.0.0", "--port", "4000"]
