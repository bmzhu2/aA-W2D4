require 'set'

#time complexity = O(n**2)
def bad_two_sum?(arr, target_sum)
  (0...arr.length - 1).each do |i|
    (i+1...arr.length).each do |j|
      return true if arr[i] + arr[j] == target_sum
    end
  end
  false
end

#time complexity(n log n)
def okay_two_sum?(arr, target_sum)
  sorted = arr.sort

  sorted.each do |num|
    complement = target_sum - num
    return true if binary_search(sorted, complement)
  end
  false
end

def binary_search(arr, target)
  return false if arr.empty?

  mid = arr.length/2
  return true if mid == target

  if arr[mid] < target
    binary_search(arr[mid+1..-1], target)
  else
    binary_search(arr[0...mid], target)
  end
end

# time complexity = O(n)
def two_sum?(arr, target)
  count = Hash.new(0)
  arr.each do |el|
    count[el] += 1
  end 

  arr.each do |el|
    complement = target - el 
    if count.has_key?(complement)
      return true unless count[el] < 2 && complement == el 
    end 
  end 
  false 
end 

arr = [0, 1, 5, 7]

p two_sum?(arr, 6)
p two_sum?(arr, 10)