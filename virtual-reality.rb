# Virtual reality game in Ruby

# Define the game map
GAME_MAP = {
  "room1" => { "name" => "Room 1", "description" => "You are in a dimly lit room. There is a door to the east.", "east" => "room2" },
  "room2" => { "name" => "Room 2", "description" => "You are in a hallway. There are doors to the north and south.", "north" => "room3", "south" => "room1" },
  "room3" => { "name" => "Room 3", "description" => "You are in a bright room. There is a door to the south.", "south" => "room2" }
}

# Define the player class
class Player
  attr_accessor :name, :current_room

  def initialize(name, starting_room)
    @name = name
    @current_room = starting_room
  end

  def move(direction)
    next_room = GAME_MAP[@current_room][direction]
    if next_room
      @current_room = next_room
      describe_current_room
    else
      puts "You cannot go that way."
    end
  end

  def describe_current_room
    room = GAME_MAP[@current_room]
    puts "#{room['name']}\n\n#{room['description']}"
  end
end

# Main program
puts "Welcome to the Virtual Reality Game!"
puts "What is your name?"
player_name = gets.chomp
player = Player.new(player_name, "room1")

loop do
  player.describe_current_room
  puts "Which direction would you like to go? (north/south/east/west)"
  direction = gets.chomp.downcase
  player.move(direction)
end
