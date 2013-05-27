File.open(ARGV[0]).each_line do |line|
  arr = line.strip.split('')
  value = 0
  arr.each_with_index do |chr, idx|
    multiplier = 16 ** (arr.length - idx - 1)
    if chr.ord >= 48 and chr.ord <= 57
      value += chr.to_i * multiplier
    elsif chr.ord >= 97 and chr.ord <= 102
      value += (chr.ord - 87) * multiplier
    end
  end
  puts value
end