#!/bin/sh

GITHUB_BRANCH=$1
GITLAB_BRANCH=$2

if [ -z "$GITHUB_BRANCH" ] || [ -z "$GITLAB_BRANCH" ]; then
    echo "Usage: ./pushall.sh <github-branch> <gitlab-branch>"
    exit 1
fi

# Push to GitHub
git push github $GITHUB_BRANCH

# Check if the GitHub push was successful
if [ $? -ne 0 ]; then
    echo "Failed to push to GitHub"
    exit 1
fi

# Push to GitLab
git push gitlab $GITLAB_BRANCH

# Check if the GitLab push was successful
if [ $? -ne 0 ]; then
    echo "Failed to push to GitLab"
    exit 1
fi
