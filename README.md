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

# change branch to update
git checkout <branch>

# show the elements to be included in a commit
git show

# remove cached files:
git rm --cached -r .
```

# Test Fetch
This section is setup to test the remove status and fetch functionality