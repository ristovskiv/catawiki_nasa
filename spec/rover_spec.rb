describe Rover do

  context 'coordinates' do
    let(:rover){ Rover.new(1,2, :N)}
    specify 'x' do
      expect(rover.x).to eq 1
    end

    specify 'y' do
      expect(rover.y).to eq 2
    end
  end

  context 'validation compass point' do
    it 'is valid with compass point N, E, S or W' do
      expect{Rover.new(1,2, Rover::CARDINAL_COMPASS_POINTS.sample)}.to_not raise_error(CardinalCompassPointError)
    end

    it 'is not valid with non cardinal compass point letters' do
      expect{Rover.new(1,2, :R)}.to raise_error(CardinalCompassPointError).with_message('Invalid cardinal compass point')
    end
  end

  context 'moving' do
    let(:rover){ Rover.new(1,2, :N)}

    describe 'east' do
      it 'incremets x coordinate' do
        expect{rover.go_east!}.to change(rover, :x).by(1)
      end

      it 'not change the y coordinate' do
        expect{rover.go_east!}.not_to change(rover, :y)
      end
    end

    describe 'west' do
      it 'decrements x coordinate' do
        expect{rover.go_west!}.to change(rover, :x).by(-1)
      end

      it 'not change the y coordinate' do
        expect{rover.go_west!}.not_to change(rover, :y)
      end
    end

    describe 'north' do
      it 'not change x coordinate' do
        expect{rover.go_north!}.not_to change(rover, :x)
      end

      it 'increments the y coordinate' do
        expect{rover.go_north!}.to change(rover, :y).by(1)
      end
    end

    describe 'south' do
      it 'not change x coordinate' do
        expect{rover.go_north!}.not_to change(rover, :x)
      end

      it 'decrements the y coordinate' do
        expect{rover.go_south!}.to change(rover, :y).by(-1)
      end
    end

  end

end
