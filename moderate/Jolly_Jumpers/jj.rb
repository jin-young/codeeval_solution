File.open(ARGV[0]).each_line do |line|
  arr = line.strip.split(' ').map(&:to_i)
  n = arr.first
  arr = arr[1..-1]

  if arr.length == 1
    puts 'Jolly'
    next
  end

  # if we create check board in advance
  #check_board = {}
  #1.upto(arr.length - 1) { |v| check_board[v] = true }
  #
  #0.upto(arr.length - 2) do |idx|
  #  check_board.delete( (arr[idx] - arr[idx+1]).abs )
  #end
  #
  #if check_board.length > 0
  #  puts 'Not jolly'
  #else
  #  puts 'Jolly'
  #end

  # if we create check board during progress
  check_board = {}
  max = nil
  min = nil
  arr.each_cons(2) do |f, s|
    diff = (f-s).abs
    max = max.nil? ? diff : (max > diff ? max : diff)
    min = min.nil? ? diff : (min < diff ? min : diff)
    check_board[diff] = true
  end

  if check_board.length == (arr.length-1) and min == 1 and max == (arr.length-1)
    puts 'Jolly'
  else
    puts 'Not jolly'
  end
end