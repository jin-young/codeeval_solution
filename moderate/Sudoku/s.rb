File.open(ARGV[0]).each_line do |line|
  str1, str2 = line.strip.split(';')
  n = str1.to_i
  sudoku_board = str2.split(',').map(&:to_i)
  correct_sum = [*1..n].inject(0) {|s,v| s+v}

  col_sum=[]
  n.times { col_sum << 0 }

  row_sum = 0
  is_correct = true

  # check rows' correction and accumulate cols' value
  sudoku_board.each_with_index do |val, index|
    col_sum[index % n] += val
    if index % n == n-1
      if row_sum + val != correct_sum
        is_correct = false
        break
      else
        row_sum = 0
      end
    else
      row_sum += val
    end
  end

  is_correct = is_correct and col_sum.all? { |v| v == col_sum }

  if is_correct
    window_size = Math.sqrt(n).to_i
    0.upto(n/window_size-1) do |block_row_id|
      0.upto(n/window_size-1) do |block_col_id|
        start_idx = block_row_id * (window_size**3) + block_col_id * window_size
        sum = 0
        window_size.times do
          sum += sudoku_board[start_idx...(start_idx+window_size)].inject(0) {|s,v| s+v}
          start_idx += n
        end
        if sum != correct_sum
          is_correct = false
          break
        end
      end
    end
  end

  puts is_correct ? 'True' : 'False'
end