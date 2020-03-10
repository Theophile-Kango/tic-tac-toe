require './board.rb'
class Game
    attr_reader :player1, :player2, :board
    def initialize(player1, player2)
        @player1 = player1
        @player2 = player2
        @board = Board.new
    end

    def play(position, player)
        updated = @board.update_board(position, player)
        player.add_choice(position) if update
        update
    end

    def win?
        if @board.win_comb?(@player1.choices)
            @player1
        elsif  @board.win_comb?(@player2.choices)
            @player2
        else
            false
        end
    end
  
end