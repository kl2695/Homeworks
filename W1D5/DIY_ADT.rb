class Stack
  def initialize
    # create ivar to store stack here!
    @array = Array.new
  end



  def add(el)
    # adds an element to the stack
    @array.push(el)
  end

  def remove
    # removes one element from the stack
    if not @array.empty?
      @array.pop
    else
      return nil
    end
  end

  def show
    # return a copy of the stack
    return Array.new(@array)
  end

end

class Queue

  def initialize
    @array = Array.new
  end

  def enqueue(el)
    @array.push(el)
  end

  def dequeue
    if @array.empty?
      return nil
    else
      @array.shift
    end
  end

  def show

    return Array.new(@array)
  end


end



class Map

  def initialize
    @array = Array.new
  end

  def assign(key, value)
    if lookup(key) == nil
      @array.push([key,value])
    else
      @array.each {|el| el[1] = value if el[0] == key}
    end
  end

  def lookup(key)
    @array.each {|el| return el[1] if el[0] == key}
    return nil
  end

  def remove(key)
    @array.each {|el| @array.delete(el) if el[0] == key}
  end

  def show
    @array.map {|el| el}
  end
end
