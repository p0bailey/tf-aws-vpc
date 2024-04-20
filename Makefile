# Makefile to add, commit, push changes to Git, and manage GitHub operations including opening a pull request in the browser

# Default target
all: push create-pr

# Stage all changes
add:
	git add .

# Commit with current date
commit: add
	git commit -m "Commit on $(shell date +%Y-%m-%d)"

# Push to current branch
push: commit
	git push origin $(shell git rev-parse --abbrev-ref HEAD)

# Create and open a pull request in the browser
create-pr: push
	gh pr create --title "Update on $(shell date +%Y-%m-%d)" --body "Automated changes by Makefile." --web

.PHONY: all add commit push create-pr
