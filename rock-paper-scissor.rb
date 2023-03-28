# Define game loop
loop do
  # Prompt user to select rock, paper, or scissors
  print "Choose rock (r), paper (p), or scissors (s): "
  user_choice = gets.chomp.downcase

  # Generate random computer choice
  computer_choice = ["r", "p", "s"].sample

  # Determine winner
  if user_choice == computer_choice
    puts "Tie game!"
  elsif (user_choice == "r" && computer_choice == "s") ||
        (user_choice == "p" && computer_choice == "r") ||
        (user_choice == "s" && computer_choice == "p")
    puts "You win!"
  else
    puts "Computer wins!"
  end

  # Ask user if they want to play again
  print "Play again? (y/n): "
  play_again = gets.chomp.downcase
  break if play_again == "n"
end
