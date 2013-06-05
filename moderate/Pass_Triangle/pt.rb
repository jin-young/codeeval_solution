arr = []
rows = 0

@cache = {}

def max_sum(arr, index, current_line, last_line)
  return arr[index] if current_line == last_line
  return @cache[index] if @cache[index]

  left_child_idx = index + current_line
  right_child_idx = index + current_line + 1

  left_value = max_sum(arr, left_child_idx, current_line + 1, last_line)
  right_value = max_sum(arr, right_child_idx, current_line + 1, last_line)

  max = left_value > right_value ? left_value : right_value
  @cache[index] = arr[index] + max

  @cache[index]
end

File.open(ARGV[0]).each_line do |line|
  arr += line.strip.split(' ').map(&:to_i)
  rows += 1
end
puts max_sum(arr, 0, 1, rows)