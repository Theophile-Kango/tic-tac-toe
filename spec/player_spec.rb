require './lib/player'

describe Player do
  describe '#add_choice' do
    it 'Test if the choice is added effectively' do
      player = Player.new('Theo', 'X')
      expect(player.add_choice(1)).to eql([1])
    end
  end
end
