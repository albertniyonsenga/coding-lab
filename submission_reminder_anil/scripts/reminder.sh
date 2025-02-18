#!/usr/bin/env bash

# Source environment variables and helper functions
source ./config/config.env
source ./scripts/functions.sh

# Path to the submissions file
submissions_file="./data/submissions.txt"

# Print remaining time and run the reminder function
echo "Assignment: "
echo "Days remaining to submit:  days"
echo "--------------------------------------------"

check_submissions 
