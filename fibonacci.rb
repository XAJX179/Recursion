# frozen_string_literal: true

def fibs(integer, result = [])
  return [] if integer < 1

  integer.times do |index|
    result << if index < 2
                index
              else
                result[index - 1] + result[index - 2]
              end
  end
  result
end

pp fibs(8)

def fibs_rec(integer)
  puts 'This was printed recursively'
  return [] if integer < 1

  return [0] if integer == 1
  return [0, 1] if integer == 2

  array = fibs_rec(integer - 1)
  array << (array[-1] + array[-2])
end

pp fibs_rec(1)
pp fibs_rec(2)
pp fibs_rec(3)
pp fibs_rec(4)
pp fibs_rec(5)
pp fibs_rec(6)
pp fibs_rec(7)
pp fibs_rec(8)
