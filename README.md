# Tidy-Tuesdays Project

# Key Components
weekly_projects: This directory contains subdirectories for each Tidy Tuesday project. Each week's project is isolated, making it easier to manage and understand.

docker: Holds Dockerfile configurations for the various environments you need (R, Python, Shiny Server, Quarto). Organizing these by environment keeps your Docker configurations neat and manageable.

kubernetes: Contains your Kubernetes manifests or Helm charts. These files define how your Docker containers are deployed and managed in Kubernetes. Separating these by service or app (R environment, Shiny, etc.) helps in easy navigation and updates.

tests: Includes test scripts or configurations for your applications. You might have unit tests for your R and Python code, as well as integration tests to ensure everything works together smoothly.

docs: Contains documentation related to project setup, deployment procedures, and any troubleshooting guides. Good documentation is invaluable for both current and future developers working on the project.