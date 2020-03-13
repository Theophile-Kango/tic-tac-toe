require_relative '../lib/board'
require_relative '../lib/player'

describe Board do
  let(:board) { Board.new }
  let(:player) { Player.new('testor', 'X') }

  describe '#filled_board' do
    it 'Test if the game board is not filled' do
      expect(board.filled_board).not_to eql(true)
    end

    it 'Test if the game board is filled' do
      (1..9).each { |pos| board.update_board(pos, player) }
      expect(board.filled_board).to eql(true)
    end
  end

  describe '#update_board' do
    it 'Test if a position is still available and changes it into the players symbol' do
      expect(board.update_board(1, player)).to eql(true)
    end

    it 'Test if a position is not available after it has been taken already and return false' do
      board.update_board(1, player)
      expect(board.update_board(1, player)).not_to eql(true)
    end
  end

  describe '#display_board' do
    it 'test if the board is displayed' do
      expect(board.display_board).to eql(board.arr)
    end
  end

  describe '#win_comb?' do
    it 'test if a user has a winning combination among his moves' do
      moves = [7, 9, 1, 2, 3]
      expect(board.win_comb?(moves)).to eql(true)
    end

    it 'test if a user does not have a winning combination among his moves' do
      moves = [7, 9, 3, 2, 4]
      expect(board.win_comb?(moves)).not_to eql(true)
    end
  end
end
