File.open(ARGV[0]).each_line do |line|
  if line.strip =~ /^[A-Z0-9._%+\-]+@(?:[A-Z0-9\-]+\.)+[A-Z]{2,4}$/i
    puts 'true'
  else
    puts 'false'
  end
end