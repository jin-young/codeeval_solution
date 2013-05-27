board = []
0.upto(255) do |row|
  board[row] = []
  256.times { board[row] << 0 }
end

File.open(ARGV[0]).each_line do |line|
  cmd, idx, val = line.strip.split(' ')
  idx = idx.to_i
  val = val.to_i
  if cmd == 'SetCol'
    0.upto(255) { |rowIdx| board[rowIdx][idx] = val }
  elsif cmd == 'SetRow'
    0.upto(255) { |colIdx| board[idx][colIdx] = val }
  elsif cmd == 'QueryCol'
    sum = 0
    0.upto(255) { |rowIdx| sum += board[rowIdx][idx] }
    puts sum
  elsif cmd == 'QueryRow'
    puts board[idx].inject(0) { |sum, v| sum + v }
  end
end