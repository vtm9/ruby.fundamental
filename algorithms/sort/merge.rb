# Mergesort: A stable divide-and-conquer sort that sorts small chunks of the container and then merges them together.
# Returns an array of the sorted elements.
# Requirements: Container should implement []
# Time Complexity: О(n log n) average and worst-case
# Space Complexity: О(n) auxiliary
# Stable: Yes
#
# Algorithms::Sort.mergesort [5, 4, 3, 1, 2] => [1, 2, 3, 4, 5]

class Array
  def merge_sort!
    return self if self.size <= 1
    mid = self.size / 2
    left = self[0...mid]
    right = self[mid...self.size]
    merge(left.merge_sort!, right.merge_sort!)
  end

  def merge(left, right)
    sorted = []
    until left.empty? or right.empty?
      left.first <= right.first ? sorted << left.shift : sorted << right.shift
    end
    sorted + left + right
  end
end