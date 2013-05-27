File.open(ARGV[0]).each_line do |line|
  arr = line.strip.split('').map(&:to_i)
  result = arr.inject(0) { |sum, val| sum + (val**arr.length) }
  puts (line.strip.to_i == result ? 'True' : 'False')
end