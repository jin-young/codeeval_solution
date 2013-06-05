File.open(ARGV[0]).each_line do |line|
  first = {}
  more_than_one = {}

  line.strip.split('').each_with_index do |ch, idx|
    if first[ch].nil? and more_than_one[ch].nil?
      first[ch] = idx
    elsif more_than_one[ch].nil?
      more_than_one[ch] = first.delete(ch)
    end
  end

  puts first.map { |key, val| [val, key] }.sort { |f,s| f[0] <=> s[0] }.first[1]
end