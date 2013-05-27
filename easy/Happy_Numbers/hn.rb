File.open(ARGV[0]).each_line do |line|
  seeds = line.strip.split('').map(&:to_i)
  history = {}
  while true
    val = seeds.inject(0) { |sum, val| sum += (val**2) }
    if val == 1
      puts 1
      break
    elsif history[val]
      puts 0
      break
    else
      history[val] = 1
    end
    seeds = val.to_s.split('').map(&:to_i)
  end
end