#!/bin/bash

# Check if the directory exists
if [ -d "D:/local_repo/Notes" ]; then
  cd D:/local_repo/Notes
else
  echo "Directory does not exist!"
  exit 1
fi

# Ensure we are on the master branch
git checkout master

# Stash any local uncommitted changes to avoid conflicts
git stash

# Pull changes from the remote repository and handle any errors
if git pull origin master -v; then
  echo "Pull successful"
else
  echo "Failed to pull changes!"
  exit 1
fi

# Restore stashed changes, if any
git stash pop

