describe Plateau do
  subject { described_class.new(5,5) }

  context 'positions' do
    describe 'lower' do
      specify 'x' do
        expect(subject.lower_x).to eq 0
      end

      specify 'y' do
        expect(subject.lower_y).to eq 0
      end
    end

    describe 'upper' do
      specify 'x' do
        expect(subject.upper_x).to eq 5
      end

      specify 'y' do
        expect(subject.upper_y).to eq 5
      end
    end
  end

  context 'adding rover' do
    let(:rover_in_bounds){ Rover.new(0,5,:N) }
    let(:rover_out_bounds){ Rover.new(0,6,:N)}

    describe 'in boundaries' do
      it 'increases rovers count' do
        expect{subject.add_rover(rover_in_bounds)}.to change{ subject.rovers.count }.by(1)
      end

      specify 'to not raise error' do
        expect{subject.add_rover(rover_in_bounds)}.to_not raise_error(RoverBoundariesError)
      end
    end

    describe 'out of boundaries' do
      specify 'to raise error' do
        expect{subject.add_rover(rover_out_bounds)}.to raise_error(RoverBoundariesError).with_message('Rover is out of the boundaries of the plateau')
      end
    end
  end

end
