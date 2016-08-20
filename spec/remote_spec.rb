describe Remote do

  context 'navigate rover' do
    let(:remote){Remote.new(Plateau.new(5,5))}
    let(:rover){Rover.new(1,2,:N)}

    describe 'with valid instruction and movement' do

      before(:each) do
        instruction = 'LMLMLMLMM'
        remote.navigate_rover(rover, instruction)
      end

      it "has expected rover info" do
        expect(rover.to_s).to eq "1 3 N"
      end
    end

    describe 'with invalid instruction' do
      it 'raises error' do
        instruction = 'LMLMLMWMM'
        expect{remote.navigate_rover(rover, instruction)}.to raise_error(InvalidInstruction).with_message('Instruction contains invalid letters')
      end
    end

    describe 'with invalid movement' do
      it 'raises error' do
        instruction = 'LMLMLMLMMMMMMMMM'
        expect{remote.navigate_rover(rover, instruction)}.to raise_error(RoverBoundariesError).with_message('Rover is out of the boundaries of the plateau')
      end
    end

  end

end
