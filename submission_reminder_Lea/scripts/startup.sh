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
