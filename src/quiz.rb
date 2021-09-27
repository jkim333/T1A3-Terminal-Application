require 'json'
require 'uri'
require 'net/http'
require 'nokogiri'
require 'colorize'


class Quiz
    @@NUM_QUESTIONS = {
        'a' => 5,
        'b' => 10,
        'c' => 15,
    }
    @@CATEGORIES = {
        'a' => 9, # General Knowledge
        'b' => 23, # History
        'c' => 19, # Science: Mathematics
        'd' => 18, # Science: Computers
        'e' => 21, # Sports
        'f' => 27, # Animals
    }
    @@DIFFICULTIES = {
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

        puts "Please enter your nickname for the game (must be 30 characters or less):"
        nickname = gets.chomp

        if !(nickname.strip.length <= 30)
            raise "Your nickname must be 30 characters or less!"
        end

        clear_terminal

        return nickname
    end

    def get_num_questions
        # This method gets the number of questions from the user.
        # Return num_questions.

        puts "How many questions would you like to play?"
        puts "A\t5"
        puts "B\t10"
        puts "C\t15"

        ans = gets.chomp.downcase

        if @@NUM_QUESTIONS[ans]
            num_questions = @@NUM_QUESTIONS[ans]
        else
            raise "You have entered an invalid key. Please try again."
        end

        clear_terminal

        return num_questions
    end

    def get_category
        # This method gets the category of questions from the user.
        # Return category.

        puts "Please select a category:"
        puts "A\tGeneral Knowledge"
        puts "B\tHistory"
        puts "C\tScience: Mathematics"
        puts "D\tScience: Computers"
        puts "E\tSports"
        puts "F\tAnimals"

        ans = gets.chomp.downcase

        if @@CATEGORIES[ans]
            category = @@CATEGORIES[ans]
        else
            raise "You have entered an invalid key. Please try again."
        end

        clear_terminal

        return category
    end

    def get_difficulty
        # This method gets the level of difficulty from the user.
        # Return difficulty

        puts "Please select the level of difficulty:"
        puts "A\tEasy"
        puts "B\tMedium"
        puts "C\tHard"

        ans = gets.chomp.downcase

        if @@DIFFICULTIES[ans]
            difficulty = @@DIFFICULTIES[ans]
        else
            raise "You have entered an invalid key. Please try again."
        end

        clear_terminal

        return difficulty
    end

    def fetch_questions(num_questions, category, difficulty)
        # This method makes a request to the external API to grab the questions.
        # Return questions, all_answers, and correct_answers

        url = "https://opentdb.com/api.php?amount=#{num_questions}&category=#{category}&difficulty=#{difficulty}"

        puts "Please wait a few seconds to prepare the questions...".colorize(:yellow)

        uri = URI(url)
        res = Net::HTTP.get_response(uri)
        body =  JSON.parse(res.body) if res.is_a?(Net::HTTPSuccess)
        if body["results"].length == 0
            raise "We were unable to fetch the questions."
        end

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

    def ask_question(question, all_answers, correct_answer, question_no, no_questions)
        # This method asks the user a question and accepts user's answer as input.
        # Return is_answer_correct and user_entered_answer
        
        # Available options for users to choose from. e.g. a, b, c, d.
        options = (0...all_answers.length).map do |i|
            (i + 97).chr # 97.chr returns "a", 98.chr returns "b", and so on
        end

        answer_index = all_answers.find_index(correct_answer)

        is_answer_correct = false

        while true
            puts "Question #{question_no} of #{no_questions}: #{question}".colorize(:light_blue)

            (0...all_answers.length).each do |i|
                puts "#{options[i].upcase}\t#{all_answers[i]}"
            end
        
            ans = gets.chomp.downcase

            if options.find_index(ans)
                is_answer_correct = options.find_index(ans) == answer_index
                break
            end

            clear_terminal
        end

        user_entered_answer = all_answers[options.find_index(ans)]

        clear_terminal

        return is_answer_correct, user_entered_answer
    end

    def show_results(nickname, score, questions, correct_answers, user_entered_answers)
        # This method present the score, showing how well the user performed at answering the questions.
        # It will show a tailored reaction based on the score.
        # This method does not return anything.

        score_pct = score.to_f / questions.length * 100

        if score_pct >= 75
            puts "Well done #{nickname}! You are a genius!".colorize(:light_blue)
        elsif score_pct >= 50
            puts "Nice try #{nickname}. You did a good job.".colorize(:light_blue)
        else
            puts "Good effort #{nickname}! Try again next time.".colorize(:light_blue)
        end

        puts "Your've answered #{score} questions correct out of #{questions.length} questions.".colorize(:light_green)
        puts ""
        
        while true
            puts "What would you like to do next?"
            puts "A\tReview my answers."
            puts "B\tPlay again."
            puts "C\tQuit this game."

            ans = gets.chomp.downcase

            if ['a', 'b', 'c'].include? ans
                break
            end

            clear_terminal
        end

        clear_terminal

        case ans
        when 'a'
            review_answers(nickname, questions, correct_answers, user_entered_answers)
        when 'b'
            run(nickname)
        when 'c'
            puts "Thanks for playing this game #{nickname}! See you again :)"
        end
    end

    def review_answers(nickname, questions, correct_answers, user_entered_answers)
        # This method loops through every question and compare the correct answer to the user's answer.

        clear_terminal

        (0...questions.length).each do |i|
            puts "Question #{i+1} of #{questions.length}: #{questions[i]}".colorize(:light_blue)
            puts "Your answer was: #{user_entered_answers[i]}".colorize(:light_green)
            puts "The correct answer was: #{correct_answers[i]}".colorize(:light_green)
            puts ""
            puts "Press Enter key to move to the next question.".colorize(:yellow)
            gets
            clear_terminal
        end

        while true
            puts "What would you like to do next?"
            puts "A\tPlay again."
            puts "B\tQuit this game."

            ans = gets.chomp.downcase

            if ['a', 'b'].include? ans
                break
            end

            clear_terminal
        end

        clear_terminal

        case ans
        when 'a'
            run(nickname)
        when 'b'
            puts "Thanks for playing this game #{nickname}! See you again :)"
        end
    end

    def run(nickname)
        # This method is invoked to run the quiz.

        clear_terminal

        puts "Welcome to Trivia Quiz game!".colorize(:light_blue)

        if !nickname
            while true
                begin
                    nickname = get_nickname
                    break
                rescue StandardError => e
                    clear_terminal
                    puts e.to_s.colorize(:red)
                end
            end
        end

        clear_terminal

        puts "Welcome to the game, #{nickname}!".colorize(:light_blue)

        while true
            begin
                num_questions = get_num_questions
                break
            rescue StandardError => e
                clear_terminal
                puts e.to_s.colorize(:red)
            end
        end

        while true
            begin
                category = get_category
                break
            rescue StandardError => e
                clear_terminal
                puts e.to_s.colorize(:red)
            end
        end

        while true
            begin
                difficulty = get_difficulty
                break
            rescue StandardError => e
                clear_terminal
                puts e.to_s.colorize(:red)
            end
        end

        begin
            questions, all_answers, correct_answers = fetch_questions(num_questions, category, difficulty)
        rescue StandardError => e
            puts "Something happened while fetching the questions.".colorize(:red)
            puts e.to_s.colorize(:red)
            puts "Please try again next time.".colorize(:red)
            exit
        end

        score = 0
        user_entered_answers = []

        for i in 0...questions.length
            is_answer_correct, user_entered_answer = ask_question(questions[i], all_answers[i], correct_answers[i], i+1, questions.length)

            if is_answer_correct
                score += 1
            end

            user_entered_answers << user_entered_answer
        end

        show_results(nickname, score, questions, correct_answers, user_entered_answers)
    end
end
