#!/usr/bin/env ruby
class Player
  attr_accessor :name, :sign
  def initialize(name, sign)
    @name = name
    @sign = sign
  end
end

def get_name(rank)
  puts "Player #{rank} type your name please"
  gets.chomp
end

def display_board(arr)
  arr.each do |elt|
    elt.each { |i| print " #{i} |" }
    puts
  end
end

def check_pos(board, position)
  res = false
  board.each do |elt|
    res = true if elt.any?(position)
  end
  res
end

def mark(board, index, sub_index, position, player)
  marked = false
  if board[index][sub_index] == position
    board[index][sub_index] = player.sign
    marked = true
  end
  marked
end

def mark_cell(position, board, player)
  res = check_pos(board, position)
  if res
    i = 0
    while i < board.length
      j = 0
      while j < board.length
        mark(board, i, j, position, player)
        j += 1
      end
      i += 1
    end
  end
  res
end

def play(player, board)
  puts puts "#{player.name}, please choose a number on the board"
  choice = gets.chomp
  mark_cell(choice.to_i, board, player)
end

def filled_board(arr)
  res = false
  arr.each do |elt|
    res = elt.all?(String)
  end
  res
end

def start(board, player1, player2)
  current_player = player1
  prev_player = player2
  until filled_board(board)
    result = play(current_player, board)
    result = play(current_player, board) until result
    display_board(board)
    current_player, prev_player = prev_player, current_player
  end
end

board = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]

player1 = Player.new(get_name(1), 'X')

player2 = Player.new(get_name(2), 'O')

display_board(board)

start(board, player1, player2)
