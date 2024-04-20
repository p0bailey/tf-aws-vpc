# Makefile to add, commit, and push changes to Git

# Default target
all: push

# Stage all changes
add:
	git add .

# Commit with current date
commit: add
	git commit -m "Commit on $(shell date +%Y-%m-%d)"

# Push to current branch
push: commit
	git push origin $(shell git rev-parse --abbrev-ref HEAD)

.PHONY: all add commit push
