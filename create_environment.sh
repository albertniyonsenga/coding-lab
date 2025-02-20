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
cat << 'EOF' > "$main_repo/config/config.env"
# This is the config file content
ASSIGNMENT="Shell Navigation"
DAYS_REMAINING=2
EOF

#Adding the scripts basing on the given template
cat << 'EOF' > "$main_repo/scripts/reminder.sh"
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
EOF

# Time for function sasa
cat << 'EOF' > "$main_repo/scripts/functions.sh"
#!/usr/bin/env bash

# Function to read submissions file and output students who have not submitted

check_submissions (){
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
EOF

#Adding data via submission text file
cat << 'EOF' > "$main_repo/data/submissions.txt"
student, assignment, submission status
Chinemerem, Shell Navigation, not submitted
Chiagoziem, Git, submitted
Divine, Shell Navigation, not submitted
Anissah, Shell Basics, submitted
Albert, Shell process and signals, not submitted
Diana, Git, not submitted
Travis, Shell Navigation, submitted
Nadia, Shell Basics, not submitted
Uche, Git, not submitted
Tella, Shell Navigation, not submitted
EOF

#let's also add startup but we are still crafting logic via awk or any other way
cat << 'EOF' > "$main_repo/scripts/startup.sh"
#!/usr/bin/env bash
# Logic will go down below
echo "Starting the Submission Reminder app..."

source ../config/config.env
source ./reminder.sh

./reminder.sh

main(){
     reminder
     echo "We are done!"
}
main
EOF

# So far we are good
# Adding execution command to all created scripts
chmod +x "$main_repo/scripts/reminder.sh" "$main_repo/scripts/functions.sh" "$main_repo/scripts/startup.sh"
