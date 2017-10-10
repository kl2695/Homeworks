class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14) { Array.new }
    stones
  end

  def stones
    @cups.each_with_index do |el, i|
      next if i == 6 || i == 13
      4.times do
        el << :stone
      end
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end


  def move(start_pos, current_player_name)
    # empties cup
    stones = @cups[start_pos]
    @cups[start_pos] = []

    cup_idx = start_pos
    until stones.empty?
      cup_idx = 0 if cup_idx > 13


      if cup_idx == 6
        temp = stones.pop if current_player_name == @name1
        @cups[6].push(temp)
      elsif cup_idx == 13
        temp = stones.pop if current_player_name == @name2
        @cups[13].push(temp)
      else
        temp = stones.pop
        @cups[cup_idx].push(temp)
      end
      cup_idx += 1

    end

    render
    next_turn(cup_idx)
  end

  def valid_move?(start_pos)
    raise "Invalid move" if start_pos < 0 || start_pos > 12
    raise "Invalid move" if @cups[start_pos].empty?
  end

def next_turn(end_cup_index)
  if end_cup_index == 6 || end_cup_index== 13
    :prompt
  elsif @cups[end_cup_index].count == 1
    :switch
  else
    end_cup_index
  end
end





  def winner
    player1_count = @cups[6].count
    player2_count = @cups[13].count

    if player1_count == player2_count
      :draw
    else
      player1_count > player2_count ? @name1 : @name2
    end
  end

  def side_empty?
    @cups.take(6).all? { |cup| cup.empty? } ||
    @cups[7..12].all? { |cup| cup.empty? }
  end
end
