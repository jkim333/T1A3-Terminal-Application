require 'rspec'
require_relative '../quiz'

describe "get_nickname" do
    it "should return nickname length 30 characters or less" do
        quiz = Quiz.new

        allow($stdin).to receive(:gets).and_return("nickname")

        nickname = quiz.get_nickname
        expect(nickname).to eq "nickname"
    end

    it "should raise error when nickname length more than 30 characters" do
        quiz = Quiz.new

        allow($stdin).to receive(:gets).and_return("a" * 50)

        expect{quiz.get_nickname}.to raise_error(RuntimeError, "Your nickname must be 30 characters or less!")
    end
end

describe "get_num_questions" do
    it "should return 5 when user input is 'a'" do
        quiz = Quiz.new

        allow($stdin).to receive(:gets).and_return("a")

        num_questions = quiz.get_num_questions

        expect(num_questions).to eq 5
    end

    it "should return 10 when user input is 'b'" do
        quiz = Quiz.new

        allow($stdin).to receive(:gets).and_return("b")

        num_questions = quiz.get_num_questions

        expect(num_questions).to eq 10
    end
    
    it "should raise error when user input is 'd'" do
        quiz = Quiz.new

        allow($stdin).to receive(:gets).and_return("d")

        expect{quiz.get_num_questions}.to raise_error(RuntimeError, "You have entered an invalid key. Please try again.")
    end
end

describe "get_category" do
    it "should return 9 when user input is 'a'" do
        quiz = Quiz.new

        allow($stdin).to receive(:gets).and_return("a")

        category = quiz.get_category

        expect(category).to eq 9
    end

    it "should return 23 when user input is 'b'" do
        quiz = Quiz.new

        allow($stdin).to receive(:gets).and_return("b")

        category = quiz.get_category

        expect(category).to eq 23
    end

    it "should raise error when user input is 'g'" do
        quiz = Quiz.new

        allow($stdin).to receive(:gets).and_return("g")

        expect{quiz.get_category}.to raise_error(RuntimeError, "You have entered an invalid key. Please try again.")
    end
end

describe "get_difficulty" do
    it "should return 'easy' when user input is 'a'" do
        quiz = Quiz.new

        allow($stdin).to receive(:gets).and_return("a")

        difficulty = quiz.get_difficulty

        expect(difficulty).to eq "easy"
    end
    
    it "should return 'hard' when user input is 'c'" do
        quiz = Quiz.new

        allow($stdin).to receive(:gets).and_return("c")

        difficulty = quiz.get_difficulty

        expect(difficulty).to eq "hard"
    end

    it "should raise error when user input is 'd'" do
        quiz = Quiz.new

        allow($stdin).to receive(:gets).and_return("g")

        expect{quiz.get_difficulty}.to raise_error(RuntimeError, "You have entered an invalid key. Please try again.")
    end
end