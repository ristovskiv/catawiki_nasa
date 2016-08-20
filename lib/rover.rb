class Rover
  attr_accessor :x, :y, :compass_point

  CARDINAL_COMPASS_POINTS = {
    :N => {left: :W, right: :E},
    :E => {left: :N, right: :S},
    :S => {left: :E, right: :W},
    :W => {left: :S, right: :N}
  }

  def initialize(x, y, compass_point)
    @x = x
    @y = y
    @compass_point = validate_cardinal_compass_point(compass_point)
  end

  def spin_left
    @compass_point = CARDINAL_COMPASS_POINTS[compass_point][:left]
  end

  def spin_right
    @compass_point = CARDINAL_COMPASS_POINTS[compass_point][:right]
  end

  def move
    case compass_point
    when :N
      go_north!
    when :E
      go_east!
    when :S
      go_south!
    when :W
      go_west!
    end
  end

  def go_east!
    @x+=1
  end

  def go_west!
    @x-=1
  end

  def go_north!
    @y+=1
  end

  def to_s
    "#{x} #{y} #{compass_point}"
  end

  def go_south!
    @y-=1
  end

  private

  def validate_cardinal_compass_point(compass_point)
    raise CardinalCompassPointError.new('Invalid cardinal compass point') unless CARDINAL_COMPASS_POINTS.keys.include?(compass_point)
    compass_point
  end
end

class CardinalCompassPointError < StandardError; end
