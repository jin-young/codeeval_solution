File.open(ARGV[0]).each_line do |line|
  line.strip.split('').each do |chr|
    if chr.ord >= 65 and chr.ord <= 90
      print (chr.ord + 32).chr
    elsif chr.ord >= 97 and chr.ord <= 122
      print (chr.ord - 32).chr
    else
      print chr
    end
  end
  puts ""
end