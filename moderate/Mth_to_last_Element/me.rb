File.open(ARGV[0]).each_line do |line|
  arr = line.strip.split(' ')
  target_index = arr.last.to_i
  puts arr[arr.length - target_index - 1]
end