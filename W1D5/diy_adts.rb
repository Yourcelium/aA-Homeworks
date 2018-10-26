class Stack
  attr_reader :stack

  def initialize
    @stack = []
  end

  def push(el)
    # adds an element to the stack
    @stack.push(el)
  end

  def pop
    # removes one element from the stack
    @stack.pop
  end

  def peek
    # returns, but doesn't remove, the top element in the stack
    return nil if @stack.empty?

    @stack[-1]
  end
end

class Queue
  attr_reader :queue

  def initialize
    @queue = []
  end

  def enqueue(el)
    @queue.push(el)
  end

  def dequeue
    @queue.shift
  end

  def peek
    return nil if @queue.empty?

    @queue.first
  end
end

class Map
  attr_reader :map

  def initialize
    @map = []
  end

  def set(key, value)
    keys = []
    @map.each { |pair| keys << pair.first }
    if keys.include?(key)
      @map.each { |pair| pair[1] = value if pair.first == key }
    else
      @map << [key, value]
    end
  end

  def get(key)
    @map.each { |pair| return pair if pair.first == key }
    nil
  end

  def delete(key)
    @map.each_with_index { |pair, idx| @map.delete_at(idx) if pair.first == key}
  end

  def show
    @map
  end

end
