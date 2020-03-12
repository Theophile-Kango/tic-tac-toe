require './lib/game'

describe Game do
    describe '#start' do
        it "Test that the game does not start whith a filled board" do
            player1 = Player.new('testor1', 'X')
            player2 = Player.new('testor2', 'O')
            game = Game.new(player1, player2)
            board = game.board
            for pos in (1..9)
                board.update_board(pos, player1)
            end
            expect(game.start).not_to eql(false)
        end
    end

    describe '#play' do
        it "Test if the player move is accepted" do
            player1 = Player.new('testor1', 'X')
            player2 = Player.new('testor2', 'O')
            game = Game.new(player1, player2)
            expect(game.play(2, player2)).to eql(true) 
        end

        it "Test if the player move is not accepted when it's out of the bound (move not between 1 and 9)" do
            player1 = Player.new('testor1', 'X')
            player2 = Player.new('testor2', 'O')
            game = Game.new(player1, player2)
            expect(game.play(10, player1)).to eql(false)
        end

        it "Test if the player move is not accepted when the position is already taken" do
            player1 = Player.new('testor1', 'X')
            player2 = Player.new('testor2', 'O')
            game = Game.new(player1, player2)
            game.play(2, player1)
            expect(game.play(2, player2)).to eql(false)
        end
    end

    describe '#win?' do
        it "Test that player1 wins when he has a winning combination among his moves" do
            player1 = Player.new('testor1', 'X')
            player2 = Player.new('testor2', 'O')
            game = Game.new(player1, player2)
            for i in (1..3) do
                player1.add_choice(i)
            end
            expect(game.win?).to eql(player1)  
        end

        it "Test nor player1, nor player2 wins when none has a winning combination among his moves" do
            player1 = Player.new('testor1', 'X')
            player2 = Player.new('testor2', 'O')
            game = Game.new(player1, player2)
            for i in [8, 4, 6] do
                player1.add_choice(i)
            end
            for i in [9, 2, 5, 7] do
                player2.add_choice(i)
            end
            expect(game.win?).to eql(false)  
        end
    end
end