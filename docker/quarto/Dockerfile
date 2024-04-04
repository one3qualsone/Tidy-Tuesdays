# Start with the Rocker R base image
FROM rocker/r-ver:4.1.0

# Install system dependencies for Quarto
RUN apt-get update && apt-get install -y \
    pandoc \
    pandoc-citeproc \
    libcurl4-gnutls-dev \
    libcairo2-dev \
    libxt-dev \
    libssl-dev \
    libssh2-1-dev \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*

# Install Quarto
RUN wget -qO- "https://github.com/quarto-dev/quarto-cli/releases/download/v0.9.534/quarto-0.9.534-linux-amd64.deb" > quarto.deb && \
    dpkg -i quarto.deb && \
    rm quarto.deb

# Set the working directory to where the Quarto projects will be mounted
WORKDIR /quarto-projects

# The default command can still be to render a Quarto project, but you may need to
# make this more dynamic depending on your projects
CMD ["quarto", "render", "your-quarto-project.qmd"]
