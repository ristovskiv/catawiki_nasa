class Plateau
  attr_reader :lower_x, :lower_y, :upper_x, :upper_y

  def initialize(upper_x, upper_y)
    @lower_x, @upper_x = 0, upper_x
    @lower_y, @upper_y = 0, upper_y
  end
end