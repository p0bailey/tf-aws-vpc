# Makefile to add, commit, push changes to Git, and manage GitHub operations

# Date format variable - robust across different systems
DATE_FORMAT := $(shell date "+%Y-%m-%d %H:%M")

# Help target to show all available actions
help:
	@echo "Available actions:"
	@echo "  make add        - Stage all changes"
	@echo "  make commit     - Commit staged changes with current date and time"
	@echo "  make push       - Push commits to the current branch"
	@echo "  make open-repo  - Open the repository in the browser"
	@echo "  make create-pr  - Create and open a pull request in the browser"
	@echo "  make all        - Run all actions"

# Default target
.DEFAULT_GOAL := help

# Stage all changes
add:
	git add .

# Commit with current date and time
commit: 
	git commit -m "Commit on $(DATE_FORMAT)"

# Push to current branch
push: 
	git push origin $(shell git rev-parse --abbrev-ref HEAD)

# Open the repository in the browser using GitHub CLI
open-repo:
	gh repo view --web

# Create and open a pull request in the browser
create-pr:
	gh pr create --title "Update on $(DATE_FORMAT)" --body "Automated changes by Makefile." --web

# Run all actions
all: push open-repo create-pr

.PHONY: help add commit push open-repo create-pr all
