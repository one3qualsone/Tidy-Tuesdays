# Tidy Tuesdays

This repository hosts a collection of [Tidy Tuesday](https://github.com/rfordatascience/tidytuesday) weekly data visualization challenges, showcasing data analysis and visualization techniques using R.

## Overview

Each week, a new dataset is analyzed and visualized, exploring different visualization techniques, statistical methods, and storytelling approaches.

## Website

The website is built using [Quarto](https://quarto.org/) and deployed to Azure Static Web Apps. Visit the live site at:

[https://tidy-tuesdays.oneequalsone.uk/](https://tidy-tuesdays.oneequalsone.uk/)

## Repository Structure

- `website/`: Contains the Quarto website files
  - `weekly_challenges/`: Weekly analyses organized by week
  - `resources/`: CSS, images, and other static resources
- `.github/workflows/`: CI/CD pipeline configuration
- `infrastructure/`: Terraform files for Azure resource provisioning

## Adding a New Challenge

To add a new weekly challenge:

1. Create a new folder under `website/weekly_challenges/` (e.g., `week6/`)
2. Add an `index.qmd` file with your analysis
3. Add any supporting data files to a `data/` subfolder
4. Commit and push to GitHub - the site will build and deploy automatically

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

The site is automatically deployed when changes are pushed to the main branch using GitHub Actions and Azure Static Web Apps.