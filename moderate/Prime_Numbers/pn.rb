prime_cache = [2,3,5,7,11]

def is_prime(prime_cache, val)
  prime_cache.each do |prime|
    return false if val % prime == 0
  end
  (prime_cache.last+1).upto(Math.sqrt(val).to_i) do |divider|
    return false if val % divider == 0
  end
  true
end

File.open(ARGV[0]).each_line do |line|
  n = line.strip.to_i
  result = []
  prime_cache.each do |prime|
    if prime > n
      break
    end
    result << prime
  end

  (prime_cache.last+1).upto(n) do |candidates|
    if is_prime(prime_cache, candidates)
      prime_cache << candidates
      result << candidates
    end
  end

  puts result.join(',')
end