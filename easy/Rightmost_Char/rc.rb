File.open(ARGV[0]).each_line do |line|
  str, target = line.strip.split(',').map(&:downcase)

  (str.length-1).downto(0) do |idx|
    if str[idx] == target
      puts idx
      break
    end
    if idx == 0 and str[idx] != target
      puts -1
    end
  end
end