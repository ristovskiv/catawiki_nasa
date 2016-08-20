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
      expect{Rover.new(1,2, Rover::CARDINAL_COMPASS_POINTS.keys.sample)}.to_not raise_error(CardinalCompassPointError)
    end

    it 'is not valid with non cardinal compass point letters' do
      expect{Rover.new(1,2, :R)}.to raise_error(CardinalCompassPointError).with_message('Invalid cardinal compass point')
    end
  end

  context 'moving' do
    let(:rover){ Rover.new(1,2, :N)}

    context 'methods' do
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

  context 'spinning' do
    let(:rover){ Rover.new(1,2, :N)}
    describe 'starting from North' do
      describe 'spin left' do
        specify '90 degrees' do
          expect{rover.spin_left}.to change(rover, :compass_point).from(:N).to(:W)
        end

        specify '180 degrees' do
          expect do
            2.times do
              rover.spin_left
            end
          end.to change(rover, :compass_point).from(:N).to(:S)
        end

        specify '270 degrees' do
          expect do
            3.times do
              rover.spin_left
            end
          end.to change(rover, :compass_point).from(:N).to(:E)
        end

        specify '360 degrees' do
          expect do
            4.times do
              rover.spin_left
            end
          end.not_to change(rover, :compass_point)
        end
      end

      describe 'spin right' do
        specify '90 degrees' do
          expect{rover.spin_right}.to change(rover, :compass_point).from(:N).to(:E)
        end

        specify '180 degrees' do
          expect do
            2.times do
              rover.spin_right
            end
          end.to change(rover, :compass_point).from(:N).to(:S)
        end

        specify '270 degrees' do
          expect do
            3.times do
              rover.spin_right
            end
          end.to change(rover, :compass_point).from(:N).to(:W)
        end

        specify '360 degrees' do
          expect do
            4.times do
              rover.spin_left
            end
          end.not_to change(rover, :compass_point)
        end
      end
    end
  end

end
