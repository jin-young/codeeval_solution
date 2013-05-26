File.open(ARGV[0]).each_line do |line|
  a,b,n = line.split(' ').map(&:to_i)
  1.upto(n) do |value|
    if value % a == 0 and value % b == 0
      print 'FB '
    elsif value % a == 0
      print 'F '
    elsif value % b == 0
      print 'B '
    else
      print "#{value} "
    end
  end
  puts ""
end