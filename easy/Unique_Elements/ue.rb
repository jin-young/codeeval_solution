File.open(ARGV[0]).each_line do |line|
  arr = line.strip.split(',')
  result = []
  arr.each do |v|
    if result.last != v
      result << v
    end
  end
  puts result.join(',')
end