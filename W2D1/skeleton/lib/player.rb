class Player
  attr_reader :name, :side

  def initialize(name, side)
    @name = name
    @side = side
  end

  def prompt
    puts "#{@name}, please enter starting cup"
    start_pos = gets.to_i
    if (start_pos.between?(1,6) && @side != 1 ||
        start_pos.between?(7,12) && @side != 2)
      raise "Not your side!"
    else
      start_pos
    end
  end
end
