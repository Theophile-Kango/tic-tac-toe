require_relative('../lib/board.rb')
require_relative './helper'
class Game
  attr_reader :player1, :player2, :board
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @board = Board.new
  end

  def start
    current_player = @player1
    prev_player = @player2
    until @board.filled_board
      result = Helper.give_turn(current_player, self)
      result = Helper.give_turn(current_player, self) until result
      @board.display_board
      winner = win?
      if winner
        Helper.winner_procl(winner)
        break
      else
        current_player, prev_player = prev_player, current_player
      end
    end
    Helper.neutral(self)
  end

  def play(position, player)
    updated = @board.update_board(position, player)
    player.add_choice(position) if updated
    updated
  end

  def win?
    if @board.win_comb?(@player1.choices)
      @player1
    elsif @board.win_comb?(@player2.choices)
      @player2
    else
      false
    end
  end
end
