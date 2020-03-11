module Helper
  def self.grid_display(arr)
    arr.each do |elt|
      elt.each { |i| print " #{i} |" }
      puts
    end
  end

  def self.get_name(rank)
    puts "Player #{rank} type your name please"
    gets.chomp
  end

  def self.give_turn(player, game)
    puts "#{player.name}, please choose a number on the board"
    choice = gets.chomp
    game.play(choice.to_i, player)
  end

  def self.winner_procl(player)
    puts "Game over, the winner is #{player.name}"
  end

  def self.neutral(game)
    puts 'Neutral game, the board is filled' if game.board.filled_board
  end

  def self.restart
    puts "It was fun!! Do you want to play again?(answer 'yes' or 'no')"
    ans = gets.chomp
    answers = %w[yes Yes YES]
    answers.include?(ans)
  end

  def self.welcome
    puts 'Welcome to Tic-tac-toe game interface buddies!!! Keep the rules in mind and have fun!!'
    puts 'Just in case you forgot, the rules are simple:'
    puts "- Choose only numbers that are available on the board when it's your turn"
    puts "- The first player got the 'X' symbol and the second an 'O'"
    puts '- The winner is the first one the have a three consecutive symbols, vertically, horizontally or cross side'
    puts '- Do not cheat and wait your turn ;-)'
    puts
  end
end
