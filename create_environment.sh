#!/usr/bin/env bash
# Here we go, first we clarify the `shebang line` to work on every machine

# Getting user's input to rename the submission reminder app repository
read -p "Enter your name: " user_name

# Creating the main repo, plus other sub-repositories
main_repo="submission_reminder_$user_name"

mkdir -p "$main_repo/config" "$main_repo/scripts" "$main_repo/data"

# Let's go to the content of the files in their respective sub-repository

