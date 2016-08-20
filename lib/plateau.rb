class Plateau
  attr_reader :lower_x, :lower_y, :upper_x, :upper_y, :rovers

  def initialize(upper_x, upper_y)
    @lower_x, @upper_x = 0, upper_x
    @lower_y, @upper_y = 0, upper_y
    @rovers = []
  end

  def add_rover(rover)
    @rovers << validate_rover_coordinates(rover)
  end

  def validate_rover_coordinates(rover)
    unless (lower_x..upper_x).include?(rover.x) && (lower_y..upper_y).include?(rover.y)
      raise RoverBoundariesError.new('Rover is out of the boundaries of the plateau')
    end
    rover
  end
end
