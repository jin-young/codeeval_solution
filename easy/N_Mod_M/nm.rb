File.open(ARGV[0]).each_line do |line|
  n,m = line.strip.split(',').map(&:to_i)
  quotient = n / m
  mod = n - (quotient * m)
  puts mod
end