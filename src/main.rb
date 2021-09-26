require 'json'
require 'uri'
require 'net/http'
require 'nokogiri'

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

    Gem.win_platform? ? system("cls") : system("clear")
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

def fetch_questions(num_questions, category, difficulty)
    # This method makes a request to the external API to grab the questions.
    # Return questions, all_answers, and correct_answers

    url = "https://opentdb.com/api.php?amount=#{num_questions}&category=#{category}&difficulty=#{difficulty}"

    puts "Please wait a few seconds to prepare the questions..."
    uri = URI(url)
    res = Net::HTTP.get_response(uri)
    body =  JSON.parse(res.body) if res.is_a?(Net::HTTPSuccess)

    clear_terminal

    data = body["results"]

    questions = []
    correct_answers = []
    all_answers = []

    data.each do |item|
        questions << (Nokogiri::HTML.parse item["question"]).text
        correct_answers << (Nokogiri::HTML.parse item["correct_answer"]).text
        all_answers << [item["correct_answer"], *item["incorrect_answers"]]
    end

    all_answers = all_answers.map do |items|
        transformed_item = items.map do |item|
            (Nokogiri::HTML.parse item).text
        end
        transformed_item.shuffle
    end

    return questions, all_answers, correct_answers
end

def main
    clear_terminal

    puts "Welcome to Trivia Quiz game!"

    nickname = get_nickname

    puts "Welcome to the game, #{nickname}!"

    num_questions = get_num_questions

    category = get_category

    difficulty = get_difficulty

    questions, answers, correct_answers = fetch_questions(num_questions, category, difficulty)

    for i in 0...questions.length
        
    end
end

main