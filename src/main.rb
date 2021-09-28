require_relative "quiz"
require 'colorize'

quiz = Quiz::Quiz.new

input_array = ARGV

if input_array.include?("-h")
    quiz.clear_terminal
    puts "Welcome to Trivia Quiz game!".colorize(:light_blue)
    puts ""
    puts "This game create a fun trivia quiz games for you.".colorize(:light_green)
    puts ""
    puts "Here is a brief summary of how the game works:"
    puts "1. The application will ask you the following questions: your nickname, the number of questions you would like to play, the quiz category, and the level of difficulty."
    puts "2. The application will then prepare the questions and present the questions to you and ask you to enter in your answer."
    puts "3. After completing all of the questions, you will be notified of your score. You will be provided with three options to choose from: (1) review all answers, (2) play again, and (3) quit the game."
    puts ""
    puts "We hope that you find this instruction helpful :)".colorize(:light_yellow)
    puts "Enjoy the game!".colorize(:light_yellow)
    puts ""
else
    quiz.run(nil)
end