File.open(ARGV[0]) do |file|
  n = file.readline.strip.to_i
  n.times do
    val = file.readline.strip.to_i
    candidate = 0
    count = 0
    found = {}
    while (candidate**2) <= val
      unless found[candidate]
        another = val - (candidate**2)
        sqrt = Math.sqrt(another).to_i
        if another == (sqrt**2)
          count += 1
          found[candidate] = 1
          found[sqrt] = 1
        end
      end
      candidate += 1
    end
    puts count
  end
end