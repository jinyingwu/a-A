def sum_to(n)
  if n < 0
    return nil
  end
  return 0 if n == 0

  n + sum_to(n - 1)
end

def add_numbers(arr)
  # return nil if arr.length == 0
  return arr.first if arr.length <= 1
  arr[0] + add_numbers(arr[1..-1])
end

def gamma_fnc(n)
  # gamma = n - 1
  # return nil if n - 1 < 0
  return nil if n < 1
  return 1 if n == 1

  (n - 1) * gamma_fnc(n - 1)
end

def ice_cream_shop(flavors, favorite)
  return true if flavors.first == favorite
  return false if flavors.length <= 0

  ice_cream_shop(flavors[1..-1], favorite)
end

def reverse(string)
  return string if string.length <= 1

  string[-1] + reverse(string[0..-2])
end

if __FILE__ == $PROGRAM_NAME
  p reverse("house") # => "esuoh"
  p reverse("dog") # => "god"
  p reverse("atom") # => "mota"
  p reverse("q") # => "q"
  p reverse("id") # => "di"
  p reverse("") # => ""
end
