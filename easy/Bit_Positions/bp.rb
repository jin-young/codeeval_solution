File.open(ARGV[0], 'r').each_line do |line|
  val, p1, p2 = line.split(',').map(&:to_i)
  p1_val, p2_val = nil, nil

  position = 1
  while p1_val.nil? or p2_val.nil?
    remainder = val % 2
    val = val / 2
    if position == p1
      p1_val = remainder
    elsif position == p2
      p2_val = remainder
    end
    position += 1
  end

  puts p1_val == p2_val
end