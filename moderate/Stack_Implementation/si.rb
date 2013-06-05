class Stack
  def initialize
    @elements = []
  end

  def push(val)
    @elements << val
  end

  def pop
    @elements.delete_at(@elements.length-1)
  end

  def empty?
    @elements.empty?
  end
end

File.open(ARGV[0]).each_line do |line|
  s = Stack.new
  line.strip.split(' ').map(&:to_i).each do |val|
    s.push(val)
  end

  count = 0
  result = []
  while not s.empty?
    if count % 2 == 0
      result << s.pop
    else
      s.pop
    end
    count += 1
  end
  puts result.join(' ')
end