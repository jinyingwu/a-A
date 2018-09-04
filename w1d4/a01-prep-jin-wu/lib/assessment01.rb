require 'byebug'
class Array

  # Monkey patch the Array class and add a my_inject method. If my_inject receives
  # no argument, then use the first element of the array as the default accumulator.

  def my_inject(accumulator = nil, &prc)
    accumulator ||= self.shift


    self.each {|el| accumulator = prc.call(accumulator, el)}

    accumulator
  end
end

# primes(num) returns an array of the first "num" primes.
# You may wish to use an is_prime? helper method.

def is_prime?(num)
  if num < 2
    return false
  end

  (2...num).each do |ele|
    return false if num % ele == 0
  end

  true
end

def primes(num)
  result = []
  count = 0
  start_num = 2

  while count < num
    if is_prime?(start_num)
      count += 1
      result << start_num
    end

    start_num += 1
  end

  result
end

# Write a recursive method that returns the first "num" factorial numbers.
# Note that the 1st factorial number is 0!, which equals 1. The 2nd factorial
# is 1!, the 3rd factorial is 2!, etc.

def factorials_rec(num)
  return [1] if num == 1
  return [] if num == 0

  factorials_rec(num - 1) + [factorials(num - 1)]

end

def factorials(num)
  return 1 if num == 0

  num * factorials(num - 1)
end


class Array

  # Write an Array#dups method that will return a hash containing the indices of all
  # duplicate elements. The keys are the duplicate elements; the values are
  # arrays of their indices in ascending order, e.g.
  # [1, 3, 4, 3, 0, 3, 0].dups => { 3 => [1, 3, 5], 0 => [4, 6] }

  def dups
    hash = Hash.new([])

    self.each_with_index do |el, idx|
        hash[el] += [idx]
    end
    hash.select {|k, v| v.length > 1}
  end

end

class String

  # Write a String#symmetric_substrings method that returns an array of substrings
  # that are palindromes, e.g. "cool".symmetric_substrings => ["oo"]
  # Only include substrings of length > 1.

  def symmetric_substrings
    i = 0
    result = []

    while i != self.length - 1
      last = i + 1
      while last != self.length
        result << self[i..last] if palindromes?(self[i..last])
        last += 1
      end
      i += 1
    end

    result
  end

  def palindromes?(str)
    if str == str.reverse
      return str
    end

    false
  end
end

class Array

  # Write an Array#merge_sort method; it should not modify the original array.

  def merge_sort(&prc)
    return [] if self.length < 1
    return self if self.length == 1

    mid = self.length / 2
    left = self[0...mid]
    right = self[mid..-1]

    result = Array.merge(left.merge_sort, right.merge_sort)

    if prc != nil
      result.sort! {|num1, num2| prc.call(num1, num2)}
    end

    result
  end

  private
  def self.merge(left, right)
    result = []
    until left == [] || right == []
      if left.first < right.first
        result << left.shift
      else
        result << right.shift
      end
    end

    result = result + left + right
  end
end
