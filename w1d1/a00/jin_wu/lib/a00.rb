require "byebug"
# Back in the good old days, you used to be able to write a darn near
# uncrackable code by simply taking each letter of a message and incrementing it
# by a fixed number, so "abc" by 2 would look like "cde", wrapping around back
# to "a" when you pass "z".  Write a function, `caesar_cipher(str, shift)` which
# will take a message and an increment amount and outputs the encoded message.
# Assume lowercase and no punctuation. Preserve spaces.
#
# To get an array of letters "a" to "z", you may use `("a".."z").to_a`. To find
# the position of a letter in the array, you may use `Array#find_index`.

def caesar_cipher(str, shift)
  alphabet = ("a".."z").to_a

  result = ""


  str.split("").each do |ele|
# byebug
    if ele == " "
      result += ele
    else
      result += alphabet[(alphabet.find_index(ele) + shift) % 26]
        # byebug
    end
  end

  result
end

# Write a method, `digital_root(num)`. It should Sum the digits of a positive
# integer. If it is greater than 10, sum the digits of the resulting number.
# Keep repeating until there is only one digit in the result, called the
# "digital root". **Do not use string conversion within your method.**
#
# You may wish to use a helper function, `digital_root_step(num)` which performs
# one step of the process.

# Example:
# digital_root(4322) => digital_root(11) => (2)

def digital_root(num)
  mod = 1
  count = 1
  while mod < num
    mod *= 10
    count += 1
  end

  result = 0
  pos = 1
  # byebug
  count.times do
    result += (num / pos) % 10
    # byebug
    pos *= 10
  end
  if result > 10
    digital_root(result)
  else
    return result
  end
end

# Jumble sort takes a string and an alphabet. It returns a copy of the string
# with the letters re-ordered according to their positions in the alphabet. If
# no alphabet is passed in, it defaults to normal alphabetical order (a-z).

# Example:
# jumble_sort("hello") => "ehllo"
# jumble_sort("hello", ['o', 'l', 'h', 'e']) => 'ollhe'

def jumble_sort(str, alphabet = nil)
  if alphabet == nil
    alphabet = ("a".."z").to_a
  end
  # byebug
  # sort_arr = []
  # str.chars.each do |el|
  #   idx = alphabet.index(el)
  #
  #   sort_arr.insert(idx, el)
  # end
  #
  # sort_arr.compact.join("")

  arr = str.chars
  sorted = false

  until sorted
    sorted = true
    # byebug
    i = 0
    while i < arr.length - 1
      if alphabet.index(arr[i]) > alphabet.index(arr[i + 1])
        arr[i], arr[i + 1] = arr[i + 1], arr[i]
        sorted = false
      end
      i += 1
    end
  end

    arr.join("")
end

class Array
  # Write a method, `Array#two_sum`, that finds all pairs of positions where the
  # elements at those positions sum to zero.

  # NB: ordering matters. I want each of the pairs to be sorted smaller index
  # before bigger index. I want the array of pairs to be sorted
  # "dictionary-wise":
  #   [0, 2] before [1, 2] (smaller first elements come first)
  #   [0, 1] before [0, 2] (then smaller second elements come first)

  def two_sum
    result = []
    self.each_with_index do |ele, i|
      pos = i + 1
      while pos < self.length
        if (ele + self[pos] == 0)
          result << [i , pos]
        end
        pos += 1
      end
    end
    result
  end
end

class String
  # Returns an array of all the subwords of the string that appear in the
  # dictionary argument. The method does NOT return any duplicates.

  def real_words_in_string(dictionary)
    result = []
    dictionary.each do |ele|
      if self.index(ele)
        result << ele
      end
    end
    result
  end
end

# Write a method that returns the factors of a number in ascending order.

def factors(num)
  result = []
  i = 1

  while i <= num
    if num % i == 0
      result << i
    end
    i += 1
  end

  result 
end
