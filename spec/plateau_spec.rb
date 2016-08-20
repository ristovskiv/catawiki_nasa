require 'plateau'

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
end