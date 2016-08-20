require_relative 'rover'
require_relative 'plateau'
require_relative 'remote'

class RoverBoundariesError < StandardError; end
class CardinalCompassPointError < StandardError; end
class InvalidInstruction < StandardError; end

class App
  def self.init
    puts 'Input plateau bounds'
    plateau_boundaries = gets.chomp.strip.split
    plateau = Plateau.new(plateau_boundaries[0].to_i, plateau_boundaries[1].to_i)
    remote  = Remote.new(plateau)

    loop do
      puts "Type 'output' if you want to see rovers output or press any key to continue..."
      action = gets.chomp.strip.to_sym
      break if action == :output

      puts 'Enter coordinates for rover'
      rover_coordinates = gets.chomp.strip.split
      rover = Rover.new(rover_coordinates[0].to_i, rover_coordinates[1].to_i, rover_coordinates[2].to_sym)
      plateau.add_rover(rover)

      puts 'Enter rover movement'
      instruction = gets.chomp.strip
      remote.navigate_rover(rover, instruction)
    end

    plateau.rovers.each{|rover| puts rover}

  end
end
