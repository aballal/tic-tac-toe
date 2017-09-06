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

      it 'cannot set a field with a player other than X or O' do
        expect { game.set_field(0, 0, '*') }.to raise_error 'Invalid player'
      end
    end

    context 'field has previously been set' do
      it 'cannot set a field that has already been set' do
        game.set_field(0, 0, 'X')
        expect { game.set_field(0, 0, 'O') }.to raise_error 'Field has been taken'
      end
    end
  end
end
