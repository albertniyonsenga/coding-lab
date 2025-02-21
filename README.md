<div align="center">
<h1>Submission Reminder App :books:</h1>
</div>

### Introduction
Imagine having a tool that will alert students about upcoming assignment deadlines; it sounds interesting. What if I told you that we made it? Let's go deep into it and how it works.

## Working⛑️

### 1. Structuring the entire application
We started by creating the structure of our application `submission_reminder_{yourName}` simulating the real-world application environment; by doing that, we made sure that it includes all necessary directories and files like `config`, `reminder.sh`, `functions.sh` and `startup.sh` as intended.

Down below is the structure of the whole application:

```
submission_reminder_{yourName}/
|
|______ app/
|        |___reminder.sh
|
|______ modules/
|        |___functions.sh
|
|______ assets/
|        |___submissions.txt
|
|______ config/
|        |___config.env
|
|______ startup.sh

```
**Note:** *{yourName}* stands for the name of anyone who's going to run the app; it can be me (Albert), Tella, John, and Whenever the app is being initiated, it will ask for that name, so that automatically it get that name as part of the application name.

So, based on the app structure, we can't go one by one creating the directories and files, which leads us to use `create_environment.sh` to create a structure for us.

### 2. How it works:
We created the file `startup.sh` to start the app when executed. Do you know about the logic? Let's talk about it based on the files.
- `reminder.sh`:
The reminder file calls the source for using their intended functions and then runs init so we can know the assignment and the remaining days to submit it. Then, we parsed the `check_submissions` functions toward the submission file to find out who hadn't submitted the assignment by then.

- `function.sh`:
The file contains scripts to read the submission file and output the students who have not submitted so that our reminder can be triggered to remind them; here is how it accomplishes that:
> - First, we have to skip the header and iterate through other lines of the submission file
> - then we go through removing the whitespace and other leading
> - Finally, we go for checking the assignment that matches the status of `not submitted`, and based on the `config.venv` file, the assignment we will be looking at is `Shell Navigation`.

- `submission.txt`:
The main file contains the student records with the student's name, assignment, and status(whether they submitted it or not).

- `startup.sh`:
As mentioned earlier, this file will help to run the `submission_reminder_app` in general, and to accomplish that, we called all the functions from the previous files so that we can run the whole system with ease so here we used the `welcome function from `startup.sh` itself, `reminder` function from `./app/reminder.sh` and then we go 🧘‍♂️

## Running the app 🏃 
To witness the power of Linux as a flexible platform for developing applications, we will leverage the shell script capability to automate stuff for us. We are becoming lazy for good.
Wanna join the drill, hum? Let's go:

1. we will start by creating the environment and easily achieve that by running the `create_environment.sh` file, which has executable permission.
```
#Use the commands below to create our  environment
./create_environment.sh
```
After that, we will be asked for our name so that the application directory will look like `submission_reminder_yourname`. After doing that, we will get confirmation that our environment is set to boom.

2. To keep on track, we will go to your submission_reminder_yourname directory to run the whole application easily. Here, we run `startup.sh`and, and then we are done. down below, we have commands to use.
```
# change directory to the app directory 
cd submission_reminder_yourname

# Execute the startup file
./startup
```
Finally, we can get who didn't submit and which assignments they didn't submit; cheers to our **Submission Reminder App**.

### Thanks for your time 🤝
