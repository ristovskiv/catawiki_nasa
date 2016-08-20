class Remote
  attr_reader :plateau

  def initialize(plateau)
    @plateau = plateau
  end

  def navigate_rover(rover, instruction)
    validate_instruction(instruction).each_char do |letter|
      case letter
      when 'L'
        rover.spin_left
      when 'R'
        rover.spin_right
      when 'M'
        validate_rover_movement(rover)
        rover.move
      end
    end
  end

  private

  def validate_rover_movement(rover)
    future_rover = rover.dup
    future_rover.move
    plateau.validate_rover_coordinates(future_rover)
  end

  def validate_instruction(instruction)
    raise InvalidInstruction.new('Instruction contains invalid letters') if instruction.match(/[^LRM]/)
    instruction
  end
end

class InvalidInstruction < StandardError; end
