#!/usr/bin/env bash

# Source environment variables and helper functions
source ../config/config.env
source ./functions.sh

# Path to the submissions file
submissions_file="../data/submissions.txt"

# Print remaining time and run the reminder function
reminder(){
        echo "Assignment: $ASSIGNMENT"
        echo "Days remaining to submit: $DAYS_REMAINING days"
        echo "--------------------------------------------"

        check_submissions $submissions_file
}

reminder
