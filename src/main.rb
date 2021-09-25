require 'uri'
require 'net/http'

# uri = URI('https://opentdb.com/api.php?amount=10')
# res = Net::HTTP.get_response(uri)
# puts res.body if res.is_a?(Net::HTTPSuccess)

NUM_QUESTIONS = {
    'a' => 5,
    'b' => 10,
    'c' => 15,
}

CATEGORIES = {
    'a' => 9, # General Knowledge
    'b' => 23, # History
    'c' => 19, # Science: Mathematics
    'd' => 18, # Science: Computers
    'e' => 21, # Sports
    'f' => 27, # Animals
}

DIFFICULTIES = {
    'a' => 'easy',
    'b' => 'medium',
    'c' => 'hard',
}

def clear_terminal
    # This method clears the user's terminal screen

    Gem.win_platform? ? system('cls') : system('clear')
end

def get_nickname
    # This method gets nickname for the game from the user.
    # Return nickname.

    while true
        puts "Please enter your nickname for the game (must be 30 characters or less):"
        nickname = gets.chomp

        if nickname.strip.length <= 30
            break
        end

        clear_terminal
    end

    clear_terminal

    return nickname
end

def get_num_questions
    # This method gets the number of questions from the user.
    # Return num_questions.

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

        clear_terminal
    end

    clear_terminal

    return num_questions
end

def get_category
    # This method gets the category of questions from the user.
    # Return category.

    while true
        puts "Please select a category:"
        puts "A\tGeneral Knowledge"
        puts "B\tHistory"
        puts "C\tScience: Mathematics"
        puts "D\tScience: Computers"
        puts "E\tSports"
        puts "F\tAnimals"

        ans = gets.chomp.downcase

        if CATEGORIES[ans]
            category = CATEGORIES[ans]
            break
        end

        clear_terminal
    end

    clear_terminal

    return category
end

def get_difficulty
    # This method gets the level of difficulty from the user.
    # Return difficulty

    while true
        puts "Please select the level of difficulty:"
        puts "A\tEasy"
        puts "B\tMedium"
        puts "C\tHard"

        ans = gets.chomp.downcase

        if DIFFICULTIES[ans]
            difficulty = DIFFICULTIES[ans]
            break
        end

        clear_terminal
    end

    clear_terminal

    return difficulty
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

    puts "Welcome to the game, #{nickname}!"

    num_questions = get_num_questions

    category = get_category

    difficulty = get_difficulty
end

main