require 'set'

class Octupus


  tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]
  new_tiles_array = tiles_array.to_set

  def sluggish(fish)
    longest = ""
    i=0
    while i < fish.length
      fish1 = fish[i]
      j=i+1
      while j < fish.length
        fish2 = fish[j]
        if fish1.length > fish2.length
          temp = fish1
        else
          temp = fish2
        end

        if temp.length > longest.length
          longest = temp
        j+=1
      end
      i+=1
    end

    return longest
  end

  def dominant(fish)
    fish = merge_sort(fish)

    return fish.last

  end

  def merge_sort(array)
    return array if array.length <=1
    median = array.length/2

    left = array.take(median)
    right = array.drop(median)

    left_sorted = merge_sort(left)
    right_sorted = merge_sort(right)

    merge(left_sorted, right_sorted)

  end

  def merge(left,right)

    result = []

    until left.empty? || right.empty?
      result <<
        ((left.first.length < right.first.length) ? left.shift : right.shift)
    end

    result + left + right
  end

  def clever(fish)
    longest = ""

    i=0
    while i < fish.length
      if fish[i].length > longest.length
        longest = fish[i]
      end
      i+=1
    end

    return longest
  end



  def slow_dance(direction, tiles_array)

    tiles_array.each_with_index do |dir,idx|
      return idx if direction == dir
    end

    return nil
  end

  def constant_dance(direction, new_tiles_array)

      return new_tiles_array.find_index(direction)
  end



end
