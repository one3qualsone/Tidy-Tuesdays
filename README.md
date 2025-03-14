# Tidy Tuesdays

This repository hosts a collection of [Tidy Tuesday](https://github.com/rfordatascience/tidytuesday) weekly data visualization challenges, showcasing data analysis and visualization techniques using R.

## Overview

Each week, a new dataset is analyzed and visualized, exploring different visualization techniques, statistical methods, and storytelling approaches.

## Website

The website is built using [Quarto](https://quarto.org/) and deployed to Vercel and Render. Visit the live sites at:

- Vercel: [https://tidy-tuesdays.vercel.app/](https://tidy-tuesdays.vercel.app/)
- Render: [https://tidy-tuesdays.onrender.com/](https://tidy-tuesdays.onrender.com/)

## Repository Structure

- `website/`: Contains the Quarto website files
  - `weekly_challenges/`: Weekly analyses organized by week
  - `resources/`: CSS, images, and other static resources
- `.github/workflows/`: CI/CD pipeline configuration
- `vercel.json`: Configuration for Vercel deployment
- `render.yaml`: Configuration for Render deployment

## Adding a New Challenge

To add a new weekly challenge:

1. Create a new folder under `website/weekly_challenges/` (e.g., `week6/`)
2. Add an `index.qmd` file with your analysis
3. Add any supporting data files to a `data/` subfolder
4. Commit and push to GitHub - the site will build and deploy automatically to both Vercel and Render

## Local Development

To develop and preview the site locally:

1. Install [Quarto](https://quarto.org/docs/get-started/)
2. Install [R](https://www.r-project.org/) and required packages
3. Navigate to the `website` directory
4. Run `quarto preview` to start a local server

## Required R Packages

```r
install.packages(c(
  "tidyverse",
  "ggplot2",
  "dplyr",
  "shiny",
  "bslib",
  "ggExtra",
  "rmarkdown",
  "knitr"
))
```

## Deployment

The site is automatically deployed when changes are pushed to the main branch using GitHub Actions to both Vercel and Render platforms.

### Setting Up Deployment

#### Vercel Setup

1. Create a Vercel account and link it to your GitHub repository
2. Set up the following repository secrets in GitHub:
   - `VERCEL_TOKEN`: Your Vercel API token
   - `VERCEL_ORG_ID`: Your Vercel organization ID
   - `VERCEL_PROJECT_ID`: The project ID for this site

#### Render Setup

1. Create a Render account and link it to your GitHub repository
2. Set up the following repository secrets in GitHub:
   - `RENDER_API_KEY`: Your Render API key
   - `RENDER_SERVICE_ID`: The service ID for this site

Once set up, every push to the main branch will trigger automatic deployments.