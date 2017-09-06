require 'controller'

describe Controller do
  let(:game) { double(:game, :over? => false) }
  subject(:controller) { described_class.new('X', game) }
  let(:controller_o) { described_class.new('O', game) }

  describe 'player going first can be set at initialisation' do
    it 'can be player X' do
      expect { puts controller }.to output(/[X.]/).to_stdout
    end

    it 'can be player O' do
      expect { puts controller_o }.to output(/[O.]/).to_stdout
    end
  end

  describe '#execute_turn' do
    it 'executes a turn for the current player' do
      expect(game).to receive(:set_field).with(0, 0, 'X')
      controller.execute_turn(0,0)
    end

    it 'switches the player' do
      allow(game).to receive(:set_field)
      controller.execute_turn(0,0)
      expect { puts controller }.to output(/[O.]/).to_stdout
    end
  end

  describe 'to_s' do
    it 'displays Game Over! Player X wins! when player X wins' do
      allow(game).to receive(:over?).and_return(true)
      allow(game).to receive(:winner).and_return('X')
      expect { print controller }.to output('Game Over! Player X wins!').to_stdout
    end

    it 'displays Game Over! Player O wins! when player O wins' do
      allow(game).to receive(:over?).and_return(true)
      allow(game).to receive(:winner).and_return('O')
      expect { print controller }.to output('Game Over! Player O wins!').to_stdout
    end

    it 'displays Game Over! It is a draw! when player neither players win' do
      allow(game).to receive(:over?).and_return(true)
      allow(game).to receive(:winner).and_return(false)
      expect { print controller }.to output('Game Over! It is a draw!').to_stdout
    end

    xit 'displays the current player and game otherwise' do

    end
  end
end
