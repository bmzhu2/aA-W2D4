
# time complexity = O(n**2)
def windowed_max_range(arr, window_size)
  max_diff = 0

  (0..arr.length - window_size).each do |i|
    diff = arr[i...i + window_size].max - arr[i...i + window_size].min
    max_diff = diff if diff > max_diff 
  end 
  max_diff 
end 

class MyQueue 
  def initialize
    @queue = []
  end 

  def enqueue(el)
    @queue << el
  end 

  def dequeue
    @queue.shift
  end

  def peek 
    @queue.first
  end 
  
  def size 
    @queue.length
  end 

  def empty?
    @queue.empty?
  end 
end 

class MyStack
  def initialize
    @store = []
  end 

  def push(el)
    @store << el
  end

  def pop
    @store.pop
  end

  def peek
    @store.last
  end

  def size
    @store.size
  end

  def empty?
    @store.empty?
  end
end 

class StackQueue
  def initialize
    @main_stack = MyStack.new
    @helper_stack = MyStack.new
  end

  def enqueue(el)
    @main_stack.push(el)
  end

  def dequeue
    @main_stack.size.times {@helper_stack.push(@main_stack.pop)}
    @helper_stack.pop
    @helper_stack.size.times {@main_stack.push(@helper_stack.pop)}
  end

  def size
    @main_stack.size
  end

  def empty?
    @main_stack.empty?
  end

end