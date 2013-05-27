File.open(ARGV[0]).each_line do |line|
  summary = {}
  arr = line.strip.split('').map(&:to_i)
  arr.each do |val|
    summary[val] ||= 0
    summary[val] += 1
  end
  is_self_desc = true
  arr.each_with_index do |val, idx|
    if val == 0 and summary[idx].nil?
      next
    elsif val != summary[idx]
      is_self_desc = false
      break
    end
  end

  puts (is_self_desc ? 1 : 0)
end