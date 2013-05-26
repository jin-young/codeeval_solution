def isPalindrome(val)
  arr = val.to_s.split('')
  arr.each_with_index do |ch, idx|
    if idx > (arr.length/2)-1
      break
    else
      if ch != arr[arr.length - 1 - idx]
        return false
      end
    end
  end
  return true
end

def isPrime(val)
  2.upto(Math.sqrt(val).to_i) do |divider|
    if val % divider == 0
      return false
    end
  end
  return true
end

999.downto(1) do |candi|
  if isPalindrome(candi) and isPrime(candi)
    puts candi
    break
  end
end