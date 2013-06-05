File.open(ARGV[0]).each_line do |line|
  str1, str2 = line.strip.split(',').map(&:strip)
  if str1.length < str2.length
    puts 0
  else
    same = true
    idx = 0
    while same and idx < str2.length
      same = str1[idx+(str1.length-str2.length)] == str2[idx]
      idx += 1
    end
    puts (same ? 1 : 0)
  end
end