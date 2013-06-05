def isPalindrome(str)
  return true if str.length == 1
  0.upto(str.length/2) do |idx|
    return false if str[idx] != str[str.length - 1 - idx]
  end
  true
end

def reverse(val)
  result = 0
  while(val > 0)
    result = (result * 10) + (val % 10)
    val = val / 10
  end
  result
end

File.open(ARGV[0]).each_line do |line|
  a = line.strip.to_i
  addition_count = 0
  while(addition_count < 1000)
    #v = a + a.to_s.reverse.to_i #ruby way
    v = a + reverse(a) # hand-made algorithm way
    addition_count += 1
    if isPalindrome(v.to_s)
      puts "#{addition_count} #{v}"
      break
    end
    a = v
  end
end