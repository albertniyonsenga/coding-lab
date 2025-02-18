#!/usr/bin/env bash
# Here we go, first we clarify the `shebang line` to work on every machine

# Getting user's input to rename the submission reminder app repository
read -p "Enter your name: " user_name

# Creating the main repo, plus other sub-repositories
main_repo="submission_reminder_$user_name"

mkdir -p "$main_repo/config" "$main_repo/scripts" "$main_repo/data"

# Let's go to the content of the files in their respective sub-repository

# After learning more about `EOL`,i believe we can achive excellent 
# Let's start with config.env using available codes given 
cat <<EOL > "$main_repo/config/config.env"
# This is the config file content
ASSIGNMENT="Shell Navigation"
DAYS_REMAINING=2
EOL

#Adding the scripts basing on the given template
cat <<EOL > "$main_repo/scripts/reminder.sh"
#!/usr/bin/env bash

# Source environment variables and helper functions
source ./config/config.env
source ./modules/functions.sh

# Path to the submissions file
submissions_file="./assets/submissions.txt"

# Print remaining time and run the reminder function
echo "Assignment: $ASSIGNMENT"
echo "Days remaining to submit: $DAYS_REMAINING days"
echo "--------------------------------------------"

check_submissions $submissions_file
EOL

# Time for function sasa
cat <<EOL > "$main_repo/scripts/functions.sh"
#!/usr/bin/env bash

# Function to read submissions file and output students who have not submitted
function check_submissions {
    local submissions_file=$1
    echo "Checking submissions in $submissions_file"

    # Skip the header and iterate through the lines
    while IFS=, read -r student assignment status; do
        # Remove leading and trailing whitespace
        student=$(echo "$student" | xargs)
        assignment=$(echo "$assignment" | xargs)
        status=$(echo "$status" | xargs)

        # Check if assignment matches and status is 'not submitted'
        if [[ "$assignment" == "$ASSIGNMENT" && "$status" == "not submitted" ]]; then
            echo "Reminder: $student has not submitted the $ASSIGNMENT assignment!"
        fi
    done < <(tail -n +2 "$submissions_file") # Skip the header
}
EOL
