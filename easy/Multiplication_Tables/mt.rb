1.upto(12) do |row|
  1.upto(12) do |col|
    if col > 1
      print "%4d" % (row * col)
    else
      print row*col
    end
  end
  puts ""
end