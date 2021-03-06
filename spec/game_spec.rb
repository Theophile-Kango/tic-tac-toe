require_relative '../lib/game'

describe Game do
  let(:player1) { Player.new('testor1', 'X') }
  let(:player2) { Player.new('testor2', 'O') }
  let(:game) { Game.new(player1, player2) }
  let(:board) { game.board }
  describe '#start' do
    it 'Test that the game does not start whith a filled board' do
      (1..9).each { |pos| board.update_board(pos, player1) }

      expect(game.start).not_to eql(false)
    end
  end

  describe '#play' do
    it 'Test if the player move is accepted' do
      expect(game.play(2, player2)).to eql(true)
    end

    it "Test if the player move is not accepted when it's out of the bound (move not between 1 and 9)" do
      expect(game.play(10, player1)).to eql(false)
    end

    it 'Test if the player move is not accepted when the position is already taken' do
      game.play(2, player1)
      expect(game.play(2, player2)).not_to eql(true)
    end
  end

  describe '#win?' do
    it 'Test that player1 wins when he has a winning combination among his moves' do
      (1..3).each { |i| player1.add_choice(i) }
      expect(game.win?).to eql(player1)
    end

    it 'Test nor player1, nor player2 wins when none has a winning combination among his moves' do
      [8, 4, 6].each { |i| player1.add_choice(i) }

      [9, 2, 5, 7].each { |i| player2.add_choice(i) }

      expect(game.win?).not_to eql(true)
    end
  end
end
