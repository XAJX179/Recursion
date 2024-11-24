# frozen_string_literal: true

def merge_sort(array)
  # print "\narray : #{array}\n"

  return array if array.length == 1

  # will keep dividing and focus on left side
  left = merge_sort(array[..(array.length / 2) - 1]) # splitting roughly
  right = merge_sort(array[array.length / 2..]) # but evenly

  # print "\nleft : #{left}\n"
  # print "\nright : #{right}\n"

  merge(left, right)

  # print "\nsorted : #{sorted}\n"
end

def merge(left, right)
  # print "\nmerge function\n"
  sorted = []
  until left.empty? || right.empty?
    if left[0] <= right[0]
      sorted << left.shift
    elsif right[0] <= left[0]
      sorted << right.shift
    end
  end
  if left.empty? && !right.empty?
    sorted += right
  elsif right.empty? && !left.empty?
    sorted += left
  end
  sorted
end

pp merge_sort([3, 2, 1, 13, 8, 5, 0, 1])
pp merge_sort([105, 79, 100, 110])
