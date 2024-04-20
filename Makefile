# Makefile to add, commit, push changes to Git, and open the repository on GitHub

# Default target
all: push open-repo

# Stage all changes
add:
	git add .

# Commit with current date
commit: add
	git commit -m "Commit on $(shell date +%Y-%m-%d)"

# Push to current branch
push: commit
	git push origin $(shell git rev-parse --abbrev-ref HEAD)

# Open the repository in the browser using GitHub CLI
open-repo:
	gh repo view --web

.PHONY: all add commit push open-repo
