# frozen_string_literal: true

rocks = 3.times.map { rand(1..200) }
puts rocks.join(', ')
max_rock = 0

rocks.each do |rock|
  max_rock = rock if rock > max_rock
end
puts max_rock

max_rock = rocks.inject { |max, rock| [max, rock].max }
puts max_rock

def judge_rock(rocks)
  if rocks.length <= 2
    a = rocks[0]
    b = rocks[-1]
  else
    a = judge_rock(rocks.slice!(0, rocks.length / 2))
    b = judge_rock(rocks)
  end
  [a, b].max
end

max_rock = judge_rock rocks
puts max_rock

def judge_rock_two(rocks)
  count = rocks.length
  a, b = count <= 2 ? [rocks[0], rocks[-1]] : [judge_rock(rocks.pop(count / 2)), judge_rock(rocks)]
  [a, b].max
end

max_rock = judge_rock rocks
puts max_rock

def countdown(num)
  i = num
  while i.positive?
    puts i
    i -= 1
  end
  puts 'hooray'
end

countdown 3

def countdown_recursive(num)
  if num <= 0
    puts 'hooray'
    return
  end
  puts num
  countdown_recursive(num - 1)
end

countdown_recursive 5

def sum_range(num)
  total = 0
  while num.positive?
    total += num
    num -= 1
  end
  total
end

puts sum_range 45

def sum_range_recursive(num, total = 0)
  return total if num <= 0

  sum_range_recursive(num - 1, total + num)
end

puts sum_range_recursive(45)

def fact(num)
  num == 1 ? 1 : num * fact(num - 1)
end

puts fact(3)
puts 1 * 2 * 3

def collatz(num, total = 0)
  return total if num == 1

  if num.even?
    collatz(num / 2, total + 1)
  else
    collatz((3 * num) + 1, total + 1)
  end
end

puts collatz 50

def palindrome(str)
  return true if str.length < 2

  return false unless str[0] == str[-1]

  palindrome(str.slice(1..-2))
end

puts palindrome('madam')
puts palindrome('rarr')
puts palindrome('amanaplanacanalpanama')
puts palindrome('racecar')

def bottles(num)
  return puts 'No more bottles of beer on the wall.' if num.zero?

  puts "#{num} bottles of beer on the wall."
  bottles(num - 1)
end

bottles(10)

#  f(0), f(1), f(2), f(3), f(4), f(5), f(6), f(7), f(8)
#     0,    1,    1,    2,    3,    5,    8,   13,   21 -> val
#     0,    1,    2,    3,    4,    5,    6,    7,    8 -> n

def fib(int)
  return 0 if int.zero?
  return 1 if int == 1

  fib(n - 1) + fib(n - 2)
end

puts fib(40)

def flat(arr)
  return arr if arr.none? { |elem| elem.is_a? Array }

  index = arr.index { |elem| elem.is_a? Array }
  value = arr[index]
  arr.delete_at(index)
  value.each do |elem|
    arr.insert(index, elem)
    index += 1
  end
  flat(arr)
end

pp flat([[1, 2], [3, 4]])
pp flat([[1, [8, 9]], [3, 4]])

roman_mapping = {
  1000 => 'M',
  900 => 'CM',
  500 => 'D',
  400 => 'CD',
  100 => 'C',
  90 => 'XC',
  50 => 'L',
  40 => 'XL',
  10 => 'X',
  9 => 'IX',
  5 => 'V',
  4 => 'IV',
  1 => 'I'
}

def to_roman_recursive(integer, hash, result = '')
  value = integer - hash.first[0]
  return result += hash.first[1] if value.zero?

  if value.positive?
    result += hash.first[1]
    to_roman_recursive(value, hash, result)
  else
    hash.shift
    to_roman_recursive(integer, hash, result)
  end
end

pp to_roman_recursive(1937, roman_mapping)

roman_mapping = {
  'M' => 1000,
  'CM' => 900,
  'D' => 500,
  'CD' => 400,
  'C' => 100,
  'XC' => 90,
  'L' => 50,
  'XL' => 40,
  'X' => 10,
  'IX' => 9,
  'V' => 5,
  'IV' => 4,
  'I' => 1
}

def to_integer_recursive(string, hash, result = 0)
  return result if string.nil?

  if hash.include? string[0..1]
    result += hash[string[0..1]]
    to_integer_recursive(string[2..], hash, result)
  else
    result += hash[string[0]]
    to_integer_recursive(string[1..], hash, result)
  end
end

pp to_integer_recursive('MMCMXXXVII', roman_mapping)
