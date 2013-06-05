File.open(ARGV[0]).each_line do |line|
  s1, s2 = line.strip.split(', ')
  target = {}
  s2.split('').each { |c| target[c] = true }

  s1.split('').each do |ch|
    print ch unless target[ch]
  end
  puts ''
end