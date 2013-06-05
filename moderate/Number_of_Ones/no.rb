File.open(ARGV[0]).each_line do |line|
  n = line.strip.to_i
  count = 0
  while n > 0
    count += 1 if n % 2 == 1
    n = n / 2
  end
  puts count
end