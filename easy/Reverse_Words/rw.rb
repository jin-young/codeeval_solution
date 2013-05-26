File.open(ARGV[0], 'r').each_line do |line|
  str = line.strip
  if str.length > 0
    arr = str.split(' ')
    (arr.length - 1).downto(1) { |idx| print "#{arr[idx]} " }
    puts arr[0]
  end
end