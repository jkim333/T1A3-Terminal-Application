require 'rspec'
require_relative '../quiz'

describe "get_nickname" do
    it "should return nickname length 30 characters or less" do
        quiz = Quiz.new

        allow($stdin).to receive(:gets).and_return("nickname")

        nickname = quiz.get_nickname
        expect(nickname).to eq "nickname"
    end

    # it "should raise error when nickname length more than 30 characters" do
    # end
end

# describe "get_num_questions" do
#     it "should return 5 when user input is 'a'" do
#     end

#     it "should return 10 when user input is 'b'" do
#     end
    
#     it "should raise error when user input is 'd'" do
#     end
# end

# describe "get_category" do
#     it "should return 9 when user input is 'a'" do
#     end

#     it "should return 23 when user input is 'b'" do
#     end

#     it "should raise error when user input is 'g'" do
#     end
# end

# describe "get_difficulty" do
#     it "should return 'easy' when user input is 'a'" do
#     end
    
#     it "should return 'hard' when user input is 'c'" do
#     end

#     it "should raise error when user input is 'd'" do
#     end
# end