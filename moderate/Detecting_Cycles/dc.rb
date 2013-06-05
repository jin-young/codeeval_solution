# since there is no enough description in the given problem,
# let assume that link to the next node is only one for each node and
# when once looping occurs, it won't be terminated until sequence is done

class Vertex
  attr_accessor :val, :next, :visited

  def initialize(val)
    @next = nil
    @val = val
    @visited = false
  end
end

File.open(ARGV[0]).each_line do |line|
  vertices = {}
  if line.strip.length > 0
    arr = line.strip.split(' ')

    current_node = nil
    head = nil

    arr.each do |val|
      if head == nil
        head = Vertex.new(val)
        current_node = head
        vertices[val] = head
      else
        if vertices[val]
          vertices[val].visited = true
        else
          vertices[val] = Vertex.new(val)
        end
        vertex = vertices[val]

        current_node.next = vertex
        current_node = current_node.next
      end
    end

    result = []
    current_node = head
    start_value = nil
    while current_node != nil and start_value != current_node.val
      if current_node.visited
        start_value = current_node.val unless start_value
        result << current_node.val
      end
      current_node = current_node.next
    end
    puts result.join(' ')
  end
end