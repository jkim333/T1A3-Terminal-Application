require 'uri'
require 'net/http'

# uri = URI('https://opentdb.com/api.php?amount=10')
# res = Net::HTTP.get_response(uri)
# puts res.body if res.is_a?(Net::HTTPSuccess)

NUM_QUESTIONS = {
    'a' => 5,
    'b' => 10,
    'c' => 15
}

CATEGORIES = {
    'a' => 9, # General Knowledge
    'b' => 23, # History
    'c' => 19, # Science: Mathematics
    'd' => 18, # Science: Computers
    'e' => 21, # Sports
    'f' => 27, # Animals
}

def clear_terminal
    # This method clears the user's terminal screen

    Gem.win_platform? ? system('cls') : system('clear')
end

def get_nickname
    # This method gets nickname for the game from the user.

    while true
        puts "Please enter your nickname for the game (must be 30 characters or less):"
        nickname = gets.chomp

        if nickname.strip.length <= 30
            break
        end
    end

    clear_terminal

    return nickname
end

def get_num_questions
    # This method gets the number of questions from the user.

    while true
        puts "How many questions would you like to play?"
        puts "A\t5"
        puts "B\t10"
        puts "C\t15"

        ans = gets.chomp.downcase

        if NUM_QUESTIONS[ans]
            num_questions = NUM_QUESTIONS[ans]
            break
        end
    end

    clear_terminal

    return num_questions
end

def main
    # This method is invoked when the game is launched.
    # The user will be asked to enter their nickname for the game.
    # If the nickname is greater than 30 characters, the application will
    # give a warning to the user. The user will be prompted again to enter a
    # correct nickname that is 30 characters or less.

    clear_terminal

    puts "Welcome to Trivia Quiz game!"

    nickname = get_nickname

    puts "Welcome #{nickname}!"

    num_questions = get_num_questions
end

main