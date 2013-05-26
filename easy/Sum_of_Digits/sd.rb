File.open(ARGV[0],'r').each_line do |line|
  puts line.strip.split('').map(&:to_i).inject(0) { |sum, val| sum += val }
end