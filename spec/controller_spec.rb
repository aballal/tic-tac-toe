require 'controller'

describe Controller do
  let(:game) { double(:game) }
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
end
