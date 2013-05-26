File.open(ARGV[0],'r').each_line do |line|
  target, divider = line.split(',').map(&:to_i)
  divider += divider while target > divider
  puts divider
end