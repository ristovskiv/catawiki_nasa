class Rover
  attr_accessor :x, :y

  CARDINAL_COMPASS_POINTS = %w(N E S W)

  def initialize(x, y, compass_point)
    @x = x
    @y = y
    @compass_point = validate_cardinal_compass_point(compass_point)
  end

  private

  def validate_cardinal_compass_point(compass_point)
    raise CardinalCompassPointError.new('Invalid cardinal compass point') unless CARDINAL_COMPASS_POINTS.include?(compass_point)
    compass_point
  end
end

class CardinalCompassPointError < StandardError; end
