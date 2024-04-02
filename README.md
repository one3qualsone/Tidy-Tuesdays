# Tidy-Tuesdays Project

# Key Components
weekly_projects: This directory contains subdirectories for each Tidy Tuesday project. Each week's project is isolated, making it easier to manage and understand.

docker: Holds Dockerfile configurations for the various environments you need (R, Python, Shiny Server, Quarto). Organizing these by environment keeps your Docker configurations neat and manageable.

kubernetes: Contains your Kubernetes manifests or Helm charts. These files define how your Docker containers are deployed and managed in Kubernetes. Separating these by service or app (R environment, Shiny, etc.) helps in easy navigation and updates.

tests: Includes test scripts or configurations for your applications. You might have unit tests for your R and Python code, as well as integration tests to ensure everything works together smoothly.

docs: Contains documentation related to project setup, deployment procedures, and any troubleshooting guides. Good documentation is invaluable for both current and future developers working on the project.




# Instructions for how to push to a branch

### GitHub: Uploading an update:
```
git add .
git commit -m "initial commit"
git remote add origin <repository-URL>
git push -u origin <branch>
```
### Useful:
```
# show which git branch you are on
git branch

#switch branches
git checkout <branch>

# push update for a customer
git push -u origin <customer_branch>
```
#### Trouble shooting:
```
# show status of git
git status

# show which branch you are currently on
git branch

# create new branch to work in
git branch <new branch>

# change branch to update
git checkout <branch>

# show the elements to be included in a commit
git show

# remove cached files:
git rm --cached -r .
```
# Revert to old version
```
# Show version history
git log --oneline

# reset to set commit
git reset --hard <commit-sha>

# force the main branch to revert
git push origin main --force
```


# Add feature to main branch
```
# Switch to main from your feature branch
git checkout main

# make sure local main is up to date
git pull origin main

# merge feature into main
git merge week1

```
# Remove branch
```
# Delete local branch
git branch -d <branch name>

# Delete remote branch
git push origin --delete <branch name>
```

