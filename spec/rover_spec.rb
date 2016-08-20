describe Rover do
  let(:compass_points){ %w(N E S W) }

  context 'coordinates' do
    let(:rover){ Rover.new(1,2, 'N')}
    specify 'x' do
      expect(rover.x).to eq 1
    end

    specify 'y' do
      expect(rover.y).to eq 2
    end
  end

  context 'validation compass point' do
    it 'is valid with compass point N, E, S or W' do
      expect{Rover.new(1,2, compass_points.sample)}.to_not raise_error(CardinalCompassPointError)
    end

    it 'is not valid with non cardinal compass point letters' do
      expect{Rover.new(1,2, 'R')}.to raise_error(CardinalCompassPointError).with_message('Invalid cardinal compass point')
    end
  end


end
