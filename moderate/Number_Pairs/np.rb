File.open(ARGV[0]).each_line do |line|
  str1, str2 = line.strip.split(';')
  arr = str1.split(',').map(&:to_i)
  n = str2.to_i

  map = {}
  arr.each { |v| map[v] = true }

  result = []
  arr.each do |val|
    map.delete(val)
    if map[n - val]
      result << "#{val},#{n-val}"
    end
  end
  if result.length > 0
    puts result.join(';')
  else
    puts 'NULL'
  end
end