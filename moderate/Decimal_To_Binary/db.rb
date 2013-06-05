File.open(ARGV[0]).each_line do |line|
  n = line.strip.to_i
  result = ''
  while n > 0
    result = (n % 2).to_s + result
    n = n / 2
  end
  puts result
end