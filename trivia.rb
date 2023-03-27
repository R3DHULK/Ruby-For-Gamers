require 'json'
require 'net/http'

class TriviaGame
  def initialize
    @score = 0
  end

  def start
    puts "Welcome to the Trivia Game!"

    while true
      # Fetch a random question from the Open Trivia Database API
      uri = URI('https://opentdb.com/api.php?amount=1&type=multiple')
      response = Net::HTTP.get(uri)
      data = JSON.parse(response)['results'][0]

      # Display the question and answer choices
      puts "\nQuestion: #{data['question']}"
      choices = data['incorrect_answers'] + [data['correct_answer']]
      choices.shuffle!
      choices.each_with_index do |choice, index|
        puts "#{index + 1}. #{choice}"
      end

      # Prompt the user for their answer
      print "\nEnter your answer (1-#{choices.length}): "
      input = gets.chomp.to_i
      if input < 1 || input > choices.length
        puts "Invalid input"
        next
      end

      # Check the user's answer and update the score
      if choices[input - 1] == data['correct_answer']
        puts "Correct!"
        @score += 1
      else
        puts "Incorrect. The correct answer is: #{data['correct_answer']}"
      end

      # Display the score
      puts "Score: #{@score}"
      
      # Ask the user if they want to play again
      print "Play again? (y/n): "
      input = gets.chomp.downcase
      if input != "y"
        break
      end
    end

    puts "Thanks for playing!"
  end
end

game = TriviaGame.new
game.start
