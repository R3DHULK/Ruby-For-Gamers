class WhacAMole
  attr_reader :score

  def initialize(num_holes)
    @num_holes = num_holes
    @holes = Array.new(num_holes) { Hole.new }
    @score = 0
  end

  def start
    puts "Whac-A-Mole!"
    puts "============"
    loop do
      print_board
      puts "Enter a hole number to whack (1-#{@num_holes}), or 'q' to quit: "
      input = gets.chomp
      break if input == 'q'
      hole_num = input.to_i
      if hole_num >= 1 && hole_num <= @num_holes
        if @holes[hole_num-1].mole_visible
          @score += 1
          @holes[hole_num-1].hide_mole
          puts "You whacked the mole! Score: #{@score}"
        else
          puts "No mole there! Score: #{@score}"
        end
      else
        puts "Invalid input. Please enter a number between 1 and #{@num_holes}."
      end
    end
    puts "Final score: #{@score}"
  end

  private

  def print_board
    puts "  " + (1..@num_holes).to_a.join(" ")
    puts @holes.map(&:to_s).join("\n")
  end
end

class Hole
  attr_reader :mole_visible

  def initialize
    @mole_visible = false
  end

  def show_mole
    @mole_visible = true
  end

  def hide_mole
    @mole_visible = false
  end

  def to_s
    @mole_visible ? "[O]" : "[ ]"
  end
end

# Usage:
game = WhacAMole.new(6)  # 6 holes
game.start
