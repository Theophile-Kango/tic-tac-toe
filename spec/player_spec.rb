require './lib/player'

describe Player do
  describe '#add_choice' do
    let(:player) { Player.new('Theo', 'X') }
    it 'Test if the choice is added effectively' do
      expect(player.add_choice(1)).to eql([1])
    end
  end
end
