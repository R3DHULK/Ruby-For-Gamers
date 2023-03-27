# Define clues for the detective game
clues = [
  { suspect: "John", location: "Library", weapon: "Knife" },
  { suspect: "Sarah", location: "Kitchen", weapon: "Poison" },
  { suspect: "David", location: "Living Room", weapon: "Rope" }
]

# Select a random culprit and generate a case file
case_file = clues.sample

puts "Welcome Detective! Your mission is to solve the case of the murdered victim."
puts "Here is what we know so far:"
puts "The victim was killed by #{case_file[:weapon]} in the #{case_file[:location]}."
puts "The possible suspects are: John, Sarah, and David."

# Game loop
loop do
  print "Who do you think is the culprit? "
  suspect = gets.chomp.capitalize

  if suspect == case_file[:suspect]
    puts "Congratulations! You solved the case! #{suspect} is the culprit."
    break
  else
    puts "Wrong suspect. Please try again."
  end
end
