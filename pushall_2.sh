#!/bin/sh

LOCAL_BRANCH=$1
GITHUB_BRANCH=$2
GITLAB_BRANCH=$3

if [ -z "$LOCAL_BRANCH" ] || [ -z "$GITHUB_BRANCH" ] || [ -z "$GITLAB_BRANCH" ]; then
    echo "Usage: ./pushall.sh <local-branch> <github-branch> <gitlab-branch>"
    exit 1
fi

# Push to GitHub
git push github $LOCAL_BRANCH:$GITHUB_BRANCH

# Check if the GitHub push was successful
if [ $? -ne 0 ]; then
    echo "Failed to push to GitHub"
    exit 1
fi

# Push to GitLab
git push gitlab $LOCAL_BRANCH:$GITLAB_BRANCH

# Check if the GitLab push was successful
if [ $? -ne 0 ]; then
    echo "Failed to push to GitLab"
    exit 1
fi
