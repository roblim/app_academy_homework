class Stack
  def initialize
    @stack = []
  end

  def add(el)
    @stack.push(el)
  end

  def remove
    @stack.pop
  end

  def show
    @stack
  end

end

class Queue
  def initialize
    @queue = []
  end

  def enqueue(el)
    @queue.push(el)
  end

  def dequeue
    @queue.shift
  end

  def show
    @queue
  end
end

class Map
  def initialize
    @map = []
  end

  def assign(key, val)
    if lookup(key)
      remove(key)
      @map << [key, val]
    else
      @map << [key, val]
    end
  end

  def lookup(key)
    @map.each { |key_value_pair| return key_value_pair[1] if key_value_pair[0] == key }
    nil
  end

  def remove(key)
    return nil unless lookup(key)
    pair = nil
    @map.each_with_index do |key_value_pair, idx|
      if key_value_pair[0] == key
        pair = @map.delete_at(idx)
        break
      end
    end
    return pair[1]
  end

  def show
    @map
  end

end
