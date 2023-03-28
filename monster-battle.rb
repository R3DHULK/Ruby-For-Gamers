# Monster battle game in Ruby

class Monster
  attr_accessor :name, :health, :attack
  
  def initialize(name, health, attack)
    @name = name
    @health = health
    @attack = attack
  end
  
  def attack(target)
    damage = rand(@attack..@attack+5)
    target.health -= damage
    puts "#{@name} attacked #{target.name} for #{damage} damage!"
  end
end

# Main program
puts "Welcome to Monster Battle!"

# Create two monsters
monster1 = Monster.new("Goblin", 30, 5)
monster2 = Monster.new("Dragon", 50, 10)

# Loop until one of the monsters is defeated
until monster1.health <= 0 || monster2.health <= 0
  # Monster 1 attacks Monster 2
  monster1.attack(monster2)
  break if monster2.health <= 0
  puts "#{monster2.name} health: #{monster2.health}"
  
  # Monster 2 attacks Monster 1
  monster2.attack(monster1)
  break if monster1.health <= 0
  puts "#{monster1.name} health: #{monster1.health}"
end

# Declare the winner
if monster1.health <= 0
  puts "#{monster2.name} wins!"
else
  puts "#{monster1.name} wins!"
end
