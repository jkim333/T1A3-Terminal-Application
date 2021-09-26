# Trivia Quiz App

This is a ruby terminal application that uses an external trivia quiz API (https://opentdb.com/api_config.php) to create fun trivia quiz games for anyone.

The user will be able to choose the number of questions they would like to answer, category (e.g. general knowledge, sports, and many more), and the level of difficulty. The application will create a trivia quiz game tailored to the user's preferences.

The link to my source control repository is: https://github.com/jkim333/T1A3-Terminal-Application

<br>

# Software Development Plan

## Purpose and Scope

This application will create trivia quiz game for the users. The purpose of this application is to provide entertainment by engaging people to play the trivia quiz game.

The user will be able to choose the number of questions they would like to answer, category (e.g. general knowledge, sports, and many more), and the level of difficulty. Depending on the choices they make, the application will create a game tailored to the user's preferences.

The application will provide entertainment, and serve as a tool for users to increase and test their knowledge. It could also be used by teachers as a tool to teach students knowledge from history, science and many other topics that are offered by the application. Students will be able to learn new knowledge while having fun playing the game.

The target audience of this application could be a range of people including teachers, adults, kids, senior citizens and anyone that wants to have fun and test and improve their knowledge. The application comes with the flexibility for the user to choose the level of difficulty, the quiz category, and the number of questions. Therefore, this application will target a wide range of audience.

In order to provide accessbility to users who don't understand Ruby programming, the application scripts will be converted to an executable file. Users can simply double click the executable file to launch the application. When the game is launched, the user will be prompted to choose the nickname. After this, the user will be prompted with the following questions: the number of questions they would like to answer, category (e.g. general knowledge, sports), and the level of difficulty. With these answers, the application will provide questions tailored to the user's preferences. After the user completes all questions, the application will present the score to show how well the user performed the quiz. Lastly, the user will have an opportunity to review their answers and compare their answers to the correct answers.

<br>

## List of features

1. **Choose nickname.** When the user runs the application, the user will first be prompted to enter their nickname for the game. The nickname will need to be 30 characters or less. Otherwise, the application will warn the user and will ask the user to enter their nickname again.

2. **Choose questions.** After the user sets their nickname, the user will then be prompted with the following questions: the number of questions they would like to answer, category (e.g. general knowledge, sports, and many more), and the level of difficulty. With these answers, the application will send a tailored request to the external API. The application will receive a response from the API which will include the questions and answers. The questions and answers will then be stored within the variables before allowing the game to begin.

3. **Show progress.** Each time a user answers a question, the application will notify the user on their progress. For example, after answering two questions out of ten questions, the application will print "Question 2 of 10: ...".

4. **Show score.** After the user completes all questions, the application will then present the score, showing how well the user performed at answering the questions. The application will also show a tailored reaction based on the score. If the user scores 75% or above, the application will print "You are a genius!". If the user scores from 50% to 75%, the application will print "Nice try. You did a good job.". If the user scores less than 50%, the application will print "Good effort. Try again.".

5. **Show results.** After the application presents the score, the application will present a range of options for the user to choose from. The application will ask the user if they want to review the answers, play again or terminate the game.

<br>

## User interaction and experience

Develop an outline of the user interaction and experience for the application.
Your outline must include:

- how the user will find out how to interact with / use each feature
- how the user will interact with / use each feature
- how errors will be handled by the application and displayed to the user

<br>

## Control flow diagram

Develop a diagram which describes the control flow of your application. Your diagram must:

- show the workflow/logic and/or integration of the features in your application for each feature.
- utilise a recognised format or set of conventions for a control flow diagram, such as UML.

<br>

## Implementation plan

Develop an implementation plan which:

- outlines how each feature will be implemented and a checklist of tasks for each feature
- prioritise the implementation of different features, or checklist items within a feature
- provide a deadline, duration or other time indicator for each feature or checklist/checklist-item

Utilise a suitable project management platform to track this implementation plan

> Your checklists for each feature should have at least 5 items.

<br>

## Help documentation

Design help documentation which includes a set of instructions which accurately describe how to use and install the application.

You must include:

- steps to install the application
- any dependencies required by the application to operate
- any system/hardware requirements

<br>

# Testing

Design TWO tests which check that the application is running as expected.

Each test should:

- cover a different feature of the application
- state what is being tested
- provide at least TWO test cases and the expected results for each test case

> An outline of the testing procedure and cases should be included with the source code of the application
