# time complexity = O(n**2)

def my_min(arr)
  sorted = false 
  while !sorted 
    sorted = true 
    (0...arr.length - 1).each do |i|
      if arr[i] > arr[i+1]
        arr[i], arr[i+1] = arr[i+1], arr[i]
        sorted = false 
      end 
    end 
  end 
  arr[0]
end 

# time complexity = O(n)

def better_min(arr)
  arr.inject do |acc, el|
    if el < acc 
      el
    else 
      acc 
    end 
  end 
end 

# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p better_min(list)


# time complexity = O(n**2)
def largest_contiguous_subsum(list)
  sub_arr = []
  (0...list.length).each do |i|
    (i...list.length).each do |j|
      sub_arr << list[i..j]
    end 
  end 

  sub_arr.inject(sub_arr[0].sum) do |acc, el|
    current_sum = el.sum
    if current_sum > acc 
      current_sum 
    else 
      acc 
    end 
  end 
end 

def better_largest_contiguous_subsum(list)
  largest = list[0]
  current_sum = 0

  list.each do |num|
    current_sum += num

    largest = current_sum if current_sum > largest
    current_sum = 0 if current_sum < 0
  end

  largest
end

list = [2, 3, -6, 7, -6, 7]
p better_largest_contiguous_subsum(list)

list = [5, 3, -7]
p better_largest_contiguous_subsum(list)

list = [-5, -1, -3]
p largest_contiguous_subsum(list)