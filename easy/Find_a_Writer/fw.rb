File.open(ARGV[0]).each_line do |line|
  string, indexes = line.strip.split('|')
  string = string.split('')
  indexes = indexes.split(' ').map(&:to_i)

  indexes.each do |idx|
    print string[idx-1]
  end
  puts ""
end