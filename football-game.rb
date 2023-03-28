class Team
  attr_accessor :name, :players

  def initialize(name)
    @name = name
    @players = []
  end

  def add_player(player)
    @players << player
  end

  def print_players
    puts "Team #{name} players:"
    players.each do |player|
      puts "- #{player.name}"
    end
  end

  def generate_score
    rand(10)
  end
end

class Player
  attr_accessor :name, :position

  def initialize(name, position)
    @name = name
    @position = position
  end
end

# Create teams
team1 = Team.new("Team A")
team2 = Team.new("Team B")

# Add players to teams
team1.add_player(Player.new("Player 1", "Forward"))
team1.add_player(Player.new("Player 2", "Midfielder"))
team1.add_player(Player.new("Player 3", "Defender"))

team2.add_player(Player.new("Player 4", "Forward"))
team2.add_player(Player.new("Player 5", "Midfielder"))
team2.add_player(Player.new("Player 6", "Defender"))

# Print players for each team
team1.print_players
team2.print_players

# Simulate game and generate scores
team1_score = team1.generate_score
team2_score = team2.generate_score

# Print result
puts "#{team1.name} #{team1_score} - #{team2_score} #{team2.name}"
if team1_score > team2_score
  puts "#{team1.name} wins!"
elsif team2_score > team1_score
  puts "#{team2.name} wins!"
else
  puts "Draw!"
end
