sum = 0
File.open(ARGV[0]).each_line do |line|
  sum += line.strip.to_i
end
puts sum