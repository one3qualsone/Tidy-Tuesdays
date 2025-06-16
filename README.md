# Tidy Tuesdays

This repository hosts a collection of [Tidy Tuesday](https://github.com/rfordatascience/tidytuesday) weekly data visualization challenges, showcasing data analysis and visualization techniques using R.

## Overview

Each week, a new dataset is analyzed and visualized, exploring different visualization techniques, statistical methods, and storytelling approaches. This project serves as a portfolio of data visualization work and a learning journey through R's data science ecosystem.

## Website

The website is built using [Quarto](https://quarto.org/) and deployed to Netlify. Visit the live site at:

https://tidytuesdays.oneequalsone.uk/

## Repository Structure

- `website/`: Contains the Quarto website files
  - `weekly_challenges/`: Weekly analyses organized by week
  - `resources/`: CSS, images, and other static resources
- `.github/workflows/`: CI/CD pipeline configuration
- `netlify.toml`: Configuration for Netlify deployment
- `Dockerfile`: For local development environment

## Adding a New Challenge

To add a new weekly challenge:

1. Create a new folder under `website/weekly_challenges/` (e.g., `week6/`)
2. Add an `index.qmd` file with your analysis
3. Add any supporting data files to a `data/` subfolder
4. Commit and push to GitHub - the site will build and deploy automatically

## Local Development

### Using Docker (Recommended)

1. Install [Docker](https://www.docker.com/get-started) and Docker Compose
2. Clone this repository
3. Run the following command in the project root:

```bash
docker-compose up
```

4. Visit http://localhost:4000 in your browser

### Manual Setup

1. Install [Quarto](https://quarto.org/docs/get-started/)
2. Install [R](https://www.r-project.org/) and required packages
3. Navigate to the `website` directory
4. Run `quarto preview` to start a local server

## Required R Packages

```r
install.packages(c(
  "dplyr",
  "ggplot2",
  "lubridate",
  "plotly",
  "maps",
  "viridis",
  "patchwork",
  "knitr",
  "kableExtra",
  "ggExtra"
))
```

## Setting Up Your Own Tidy Tuesdays Project

Want to create a similar project? Here's how:

1. **Fork or Clone this Repository**:
   ```bash
   git clone https://github.com/one3qualsone/Tidy-Tuesdays.git
   cd Tidy-Tuesdays
   ```

2. **Customize the Configuration**:
   - Update `website/_quarto.yml` with your site information
   - Modify `website/about.qmd` with your details
   - Update `netlify.toml` if needed

3. **Set Up Netlify Deployment**:
   - Create a [Netlify](https://www.netlify.com/) account
   - Connect your GitHub repository
   - Add these settings in your Netlify site:
     - Build command: Leave empty (handled by GitHub Actions)
     - Publish directory: `website/_site`

4. **Set Up GitHub Actions**:
   - Get your Netlify API token from your Netlify account settings → Applications → Personal access tokens
   - Get your Netlify Site ID from Site settings → Site information → API ID
   - Add these secrets to your GitHub repository:
     - `NETLIFY_AUTH_TOKEN`: Your Netlify API token
     - `NETLIFY_SITE_ID`: Your Netlify site ID

5. **Create Your First Challenge**:
   - Start by adapting one of the existing challenges
   - Follow the structure in the `weekly_challenges` directory

6. **Push Your Changes**:
   ```bash
   git add .
   git commit -m "Set up my Tidy Tuesdays project"
   git push
   ```

7. **Check Your Deployment**:
   - Go to your GitHub repository's Actions tab
   - Verify the workflow runs successfully
   - Visit your Netlify site URL

## Deployment

The site is automatically deployed when changes are pushed to the main branch using GitHub Actions and Netlify.
