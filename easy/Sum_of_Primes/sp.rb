primes = []
count = 0
sum = 0
value = 2

def isPrime(val, primes)
  primes.each do |p|
    return false if val % p == 0
  end
  return true
end

while count < 1000
  if isPrime(value, primes)
    primes << value
    sum += value
    count += 1
  end
  value += 1
end

puts sum