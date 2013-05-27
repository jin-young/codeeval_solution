File.open(ARGV[0]).each_line do |line|
  index = []
  line.strip.split('').map(&:downcase).each do |chr|
    if chr.ord >= 97 and chr.ord <= 122
      idx = chr.ord-97
      index[idx] ||= 0
      index[idx] += 1
    end
  end
  index = index.compact.sort
  multiplier = 26
  beautifulVal = 0
  (index.length - 1).downto(0) do |idx|
    beautifulVal += (index[idx] * multiplier)
    multiplier -= 1
  end
  puts beautifulVal
end