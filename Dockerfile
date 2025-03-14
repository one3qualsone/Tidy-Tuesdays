FROM rocker/verse:4.2.0

# Install system dependencies
RUN apt-get update && apt-get install -y \
    curl \
    wget \
    gdebi-core \
    && rm -rf /var/lib/apt/lists/*

# Install Quarto (using GitHub URL which is more reliable)
RUN wget -q https://github.com/quarto-dev/quarto-cli/releases/download/v1.3.450/quarto-1.3.450-linux-amd64.deb && \
    dpkg -i quarto-1.3.450-linux-amd64.deb && \
    rm quarto-1.3.450-linux-amd64.deb

# Install R packages - add tidyr explicitly
RUN R -e "install.packages(c('rmarkdown', 'knitr', 'dplyr', 'ggplot2', 'tidyverse', 'tidyr', 'shiny', 'bslib', 'ggExtra', 'lubridate', 'plotly', 'maps', 'viridis', 'patchwork', 'kableExtra'), repos = 'https://cloud.r-project.org/')"

# Set working directory
WORKDIR /project

# Command to run
CMD ["quarto", "preview", "--no-browser", "--host", "0.0.0.0"]