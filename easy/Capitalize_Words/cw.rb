File.open(ARGV[0]).each_line do |line|
  # puts line.strip.split(' ').map(&:capitalize).join(' ')

  arr = line.strip.split('')
  new_word = true
  arr.each do |chr|
    if chr.strip == ""
      new_word = true
      print ' '
    else
      if new_word
        if chr.ord >= 65 and chr.ord <= 90
          print chr
        elsif chr.ord >= 97 and chr.ord <= 122
          print (chr.ord - 32).chr
        else
          print chr
        end
        new_word = false
      else
        print chr
      end
    end
  end
  puts ""
end