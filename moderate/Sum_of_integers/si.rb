#O(n^2)

def o_n_square(arr)
  max_sum = -1
  0.upto(arr.length - 1) do |idx1|
    1.upto(arr.length - idx1) do |window_size|
      sum = arr[idx1...(idx1+window_size)].inject(0) { |sum, ele| sum + ele }
      max_sum = max_sum > sum ? max_sum : sum
    end
  end
  max_sum
end

File.open(ARGV[0]).each_line do |line|
  integers = line.strip.split(',').map(&:to_i)

  max_sum = o_n_square(integers)

  puts max_sum
end