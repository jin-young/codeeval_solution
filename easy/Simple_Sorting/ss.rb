File.open(ARGV[0]).each_line do |line|
  arr = line.strip.split(' ').map do |val|
    [val.to_f, val]
  end
  puts arr.sort { |f,s| f[0] <=> s[0] }.map { |v| v[1] }.join(' ')
end