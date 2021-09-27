require 'rspec'
require_relative '../quiz'

describe 'main.rb' do
    it 'should have a name' do
        quiz = Quiz.new
        expect(1).to eq 1
    end
end