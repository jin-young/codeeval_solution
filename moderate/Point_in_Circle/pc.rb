File.open(ARGV[0]).each_line do |line|
  cmds = line.strip.split(';').map do |cmd|
    cmd.split(':').map(&:strip)[1]
  end
  center_x, center_y = cmds[0].scan(/-?\d+\.?\d*/).map(&:to_f)
  radius = cmds[1].to_f
  point_x, point_y = cmds[2].scan(/-?\d+\.?\d*/).map(&:to_f)

  if Math.sqrt((center_x-point_x)**2 + (center_y-point_y)**2) < radius
    puts 'true'
  else
    puts 'false'
  end
end