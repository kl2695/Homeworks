require_relative 'board'
require_relative 'player'

class Mancala
  def initialize(name1, name2)
    @player1 = Player.new(name1, 1)
    @player2 = Player.new(name2, 2)
    @board = Board.new(name1, name2)
  end



  def take_turn(current_player)
    move_result = :prompt

    until move_result == :switch
      if move_result == :prompt
        print_indices

        begin
          start_pos = current_player.prompt
          start_pos = start_pos - 1 if start_pos <= 6
          @board.valid_move?(start_pos)
        rescue Exception
          puts "Invalid move. Try again"
        retry
        end
        move_result = @board.move(start_pos, current_player.name)
      else
        move_result = @board.move(move_result, current_player.name)
      end
      break if won?
    end
  end

  def won?
    @board.side_empty?
  end

  def play
    @board.render
    current_player = @player1
    until won?
      take_turn(current_player)
      if current_player == @player1
        current_player = @player2
      else
        current_player = @player1
    end

    puts "Game over"
  end


  def print_indices
    puts "indices:"
    puts "12  11  10   9   8   7"
    puts " 1   2   3   4   5   6"
  end
end
