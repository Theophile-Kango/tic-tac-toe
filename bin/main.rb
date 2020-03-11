#!/usr/bin/env ruby
require_relative '../lib/board.rb'
require_relative '../lib/game.rb'
require_relative '../lib/player.rb'
require_relative '../lib/helper'

repeat = true

while repeat
  Helper.welcome
  player1 = Player.new(Helper.get_name(1), 'X')

  player2 = Player.new(Helper.get_name(2), 'O')

  game = Game.new(player1, player2)
  
  game.board.display_board

  game.start

  repeat = Helper.restart
end
