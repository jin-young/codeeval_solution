File.open(ARGV[0]).each_line do |line|
  # arr = line.strip.split(' ')
  # puts arr[arr.length - 2]
  # too simple, eh?

  str = ""
  met_space = false
  arr = line.strip.split('')

  (arr.length - 1).downto(0) do |idx|
    if arr[idx].strip == ""
      if met_space
        break
      else
        met_space = true
        next
      end
    else
      if met_space
        str = arr[idx] + str
      end
    end
  end

  puts str
end