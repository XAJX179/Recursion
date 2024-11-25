# frozen_string_literal: true

def merge_sort(array)
  # print "\narray : #{array}\n"

  return array if array.length <= 1

  middle_index = array.length / 2

  # will keep dividing and focus on left side
  left = merge_sort(array[...middle_index]) # splitting roughly
  right = merge_sort(array[middle_index..]) # but evenly

  # print "\nleft : #{left}\n"
  # print "\nright : #{right}\n"

  merge(left, right)

  # print "\nsorted : #{sorted}\n"
end

def merge(left, right)
  # print "\nmerge function\n"
  sorted = []
  until left.empty? || right.empty?
    sorted << if left.first <= right.first
                left.shift
              else
                right.shift
              end
  end
  sorted + left + right
end

pp merge_sort([3, 2, 1, 13, 8, 5, 0, 1])
pp merge_sort([105, 79, 100, 110])
