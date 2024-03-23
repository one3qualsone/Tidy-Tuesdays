# Tidy-Tuesdays Project

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

