class Pet
  attr_accessor :name, :hunger, :happiness

  def initialize(name)
    @name = name
    @hunger = 0
    @happiness = 5
  end

  def feed
    self.hunger -= 1
    self.happiness += 1
    puts "#{name} is happy to be fed!"
  end

  def play
    self.hunger += 1
    self.happiness += 1
    puts "#{name} loves to play!"
  end

  def status
    puts "#{name} has hunger level of #{hunger} and happiness level of #{happiness}."
  end
end

# create a new pet and ask for its name
puts "Welcome to the virtual pet game!"
print "What would you like to name your pet? "
pet_name = gets.chomp

pet = Pet.new(pet_name)

# game loop
loop do
  puts "\nWhat would you like to do with #{pet.name}?"
  puts "1. Feed #{pet.name}"
  puts "2. Play with #{pet.name}"
  puts "3. Check #{pet.name}'s status"
  puts "4. Exit game"
  print "Enter your choice (1-4): "

  choice = gets.chomp.to_i

  case choice
  when 1
    pet.feed
  when 2
    pet.play
  when 3
    pet.status
  when 4
    puts "Thanks for playing the virtual pet game!"
    break
  else
    puts "Invalid choice. Please try again."
  end

  # update pet's status after each action
  pet.hunger += 1
  pet.happiness -= 1

  # check if pet is still alive
  if pet.hunger >= 10 || pet.happiness <= 0
    puts "#{pet.name} has died. Game over."
    break
  end
end
