# Makefile to add, commit, push changes to Git, and manage GitHub operations including creating and opening a pull request, and opening the repository in the browser

# Help target to show all available actions
help:
	@echo "Available actions:"
	@echo "  make add        - Stage all changes"
	@echo "  make commit     - Commit staged changes with current date"
	@echo "  make push       - Push commits to the current branch"
	@echo "  make open-repo  - Open the repository in the browser"
	@echo "  make create-pr  - Create and open a pull request in the browser"
	@echo "  make all        - Run all actions"

# Default target
.DEFAULT_GOAL := help

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

# Create and open a pull request in the browser
create-pr: push
	gh pr create --title "Update on $(shell date +%Y-%m-%d)" --body "Automated changes by Makefile." --web

# Run all actions
all: push open-repo create-pr

.PHONY: help add commit push open-repo create-pr all
