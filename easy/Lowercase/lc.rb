File.open(ARGV[0], 'r').each_line do |line|
  #puts line.downcase   # can I do in this way?
  line.strip.each_byte do |byte|
    if byte >= 65 and byte <= 90
      byte += 32
    end
    print byte.chr
  end
  puts ""
end