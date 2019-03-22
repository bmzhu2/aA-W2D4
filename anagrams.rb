# time complexity = O(n!)

def first_anagram?(string_1, string_2)
  anagrams = permutations(string_1)
  anagrams.include?(string_2)
end

def permutations(string)
  return [string] if string.length == 1
  
  perms = permutations(string[1..-1])
  new_perms = []

  perms.each do |perm|
    (0..perm.length).each do |i|
      new_perms << perm[0...i] + string[0] + perm[i..-1]
    end
  end
  new_perms
end

# time complexity = O(n**2)
def second_anagram?(string1, string2)
  arr = string2.chars 
  string1.each_char do |ch|
    index = arr.index(ch)
    if index
      arr.delete_at(index) 
    else 
      return false 
    end 
  end 
  true 
end 

#time complexity = O(nlogn) although technically it depends on the sort
def third_anagram?(string1, string2)
  string1.chars.sort == string2.chars.sort
  
end

#time complexity = O(n)
def fourth_anagram?(string1, string2)
  # count1 = Hash.new(0)
  # count2 = Hash.new(0)

  # string1.each_char {|char| count1[char] += 1}
  # string2.each_char {|char| count2[char] += 1}

  # count1 == count2

  count = Hash.new(0)

  string1.each_char {|char| count[char] += 1}
  string2.each_char do |char|
    count[char] -= 1
    return false if count[char] < 0
  end

  count.values.all? {|el| el == 0}
end

p fourth_anagram?("gizmo", "sally")
p fourth_anagram?("elvis", "lives") 