require 'game'

describe Game do
  subject(:game) { described_class.new }
  let(:blank) { "   \n   \n   \n" }

  describe 'initialisation' do
    it 'starts with a blank board' do
      expect { puts game }.to output(blank).to_stdout
    end
  end
end
