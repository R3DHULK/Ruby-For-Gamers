# Define Crop class
class Crop
  attr_reader :name, :growth_rate, :water_need, :light_need

  def initialize(name, growth_rate, water_need, light_need)
    @name = name
    @growth_rate = growth_rate
    @water_need = water_need
    @light_need = light_need
    @age = 0
    @height = 0
    @status = "seed"
  end

  def grow(water, light)
    @age += 1
    if water >= @water_need && light >= @light_need
      @height += @growth_rate
      @status = "mature"
    else
      @status = "seed"
    end
  end

  def needs
    "Water need: #{@water_need}\nLight need: #{@light_need}"
  end

  def status
    "Age: #{@age}\nHeight: #{@height}\nStatus: #{@status}"
  end
end

# Define Farm class
class Farm
  attr_reader :crops

  def initialize
    @crops = []
  end

  def add_crop(crop)
    @crops << crop
  end

  def simulate_day
    @crops.each do |crop|
      crop.grow(rand(1..10), rand(1..10))
    end
  end
end

# Create crops
wheat = Crop.new("Wheat", 2, 5, 5)
corn = Crop.new("Corn", 3, 6, 4)
potato = Crop.new("Potato", 4, 4, 6)

# Create farm and add crops
farm = Farm.new
farm.add_crop(wheat)
farm.add_crop(corn)
farm.add_crop(potato)

# Simulate a day and print crop status
farm.simulate_day
farm.crops.each do |crop|
  puts "Crop: #{crop.name}"
  puts crop.needs
  puts crop.status
end
