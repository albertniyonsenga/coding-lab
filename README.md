<div align="center">
<h1>Submission Reminder App :books:</h1>
</div>

## Introduction
Imagine having a tool that will alert students about upcoming assignment deadlines; sounds interesting, right? What if i told you that we made it, let's go deep into it and how it works.

## Working⛑️

### 1. Structuring the entire application
We started by creating the structure of our application `submission_reminder_{yourName}` simulating the real-world application environment; by doing that, we made sure that it includes all necessary directories and files like `config`, `reminder.sh`, `functions.sh` and `startup.sh`as intend.

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

