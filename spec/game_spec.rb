require 'game'

describe Game do
  subject(:game) { described_class.new }

  describe 'initialisation' do
    it 'starts with a blank board' do
      expect { puts game }.to output("   \n   \n   \n").to_stdout
    end

    it 'says game is not over' do
      expect(game.over?).to be false
    end
  end

  describe '#set_field' do
    context 'field has not been previously set' do
      it 'can set a field with X' do
        game.set_field(1, 1, 'X')
        expect { puts game }.to output("   \n X \n   \n").to_stdout
      end

      it 'can set a field with O' do
        game.set_field(1, 2, 'O')
        expect { puts game }.to output("   \n  O\n   \n").to_stdout
      end
    end
  end
end
