@cache = {}

def fibonacci(position)
  return position if position <= 1

  return @cache[position] if @cache[position]

  @cache[position] = fibonacci(position - 1) + fibonacci(position - 2)

  return @cache[position]
end

File.open(ARGV[0], 'r').each_line do |line|
  position = line.strip.to_i
  puts fibonacci(position)
end