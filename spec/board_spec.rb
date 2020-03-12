require './lib/board'
require './lib/player'

describe Board do
    describe '#filled_board' do
        it "Test if the game board is not filled" do
          board = Board.new
          expect(board.filled_board).to eql(false)  
        end

        it "Test if the game board is filled" do
            board = Board.new
            player = Player.new('testor', 'X')
            for pos in (1..9)
                board.update_board(pos, player)
            end
            expect(board.filled_board).to eql(true)
        end
    end

    describe '#update_board' do
        it "Test if a position is still available and changes it into the players symbol" do
            board = Board.new
            player = Player.new('testor', 'X')
            expect(board.update_board(1, player)).to eql(true)
        end

        it "Test if a position is not available after it has been taken already and return false" do
            board = Board.new
            player = Player.new('testor', 'X')
            board.update_board(1, player)
            expect(board.update_board(1, player)).to eql(false)
        end
    end

    describe '#display_board' do
        it "test if the board is displayed" do
            board = Board.new
            expect(board.display_board).to eql(board.arr) 
        end
    end

    describe '#win_comb?' do
        it "test if a user has a winning combination among his moves" do
            board = Board.new
            moves = [7, 9, 1, 2, 3] 
            expect(board.win_comb?(moves)).to eql(true)
        end

        it "test if a user does not have a winning combination among his moves" do
            board = Board.new
            moves = [7, 9, 3, 2, 4] 
            expect(board.win_comb?(moves)).to eql(false)
        end
    end
end