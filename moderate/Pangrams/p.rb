File.open(ARGV[0]).each_line do |line|
  # if we use hash, this can be solved easily.
  # alphabets = {}
  # 'a'.upto('z') {|c| alphabets[c] = c }
  # line.strip.split('').each do |c|
  #   alphabets.delete(c)
  # end
  # puts (alphabets.length == 0) ? 'NULL' : alphabets.keys.sort.join

  alphabets = []
  'a'.upto('z') {|c| alphabets << c }

  line.strip.split('').each do |c|
    idx = nil
    if c.ord >= 97 and c.ord <= 122
      alphabets[c.ord-97] = nil
    elsif c.ord >= 65 and c.ord <= 90
      alphabets[c.ord-65] = nil
    end
  end

  alphabets.compact!
  puts (alphabets.length == 0) ? 'NULL' : alphabets.join
end