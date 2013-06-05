class Node
  attr_accessor :val, :left, :right, :parent, :depth

  def initialize(val, parent = nil)
    @val, @left, @right = val, nil, nil
    @parent = parent
    @depth = parent.nil? ? 0 : parent.depth + 1
  end
end

class Tree
  attr_accessor :size

  def initialize
    @root = nil
    @size = 0
  end

  def insert(newVal, parent = @root)
    if parent.nil?
      @root = Node.new(newVal)
      @size = 1
    else
      if parent.val < newVal
        if parent.right.nil?
          parent.right = Node.new(newVal, parent)
          @size += 1
        else
          insert(newVal, parent.right)
        end
      else
        if parent.left.nil?
          parent.left = Node.new(newVal, parent)
          @size += 1
        else
          insert(newVal, parent.left)
        end
      end
    end
    @root
  end

  def elements(node = @root, result = [])
    elements(node.left, result) if node.left
    result << node.val
    elements(node.right, result) if node.right

    result
  end

  def find(val, node = @root)
    if node.val == val
      return node
    else
      if val < node.val
        find(val, node.left)
      else
        find(val, node.right)
      end
    end
  end

  def common_ancestor(v1, v2)
    next_v1, next_v2 = @root, @root
    while next_v1.val == next_v2.val
      if v1 < next_v1.val
        next_v1 = next_v1.left
      elsif v1 > next_v1.val
        next_v1 = next_v1.right
      end

      if v2 < next_v2.val
        next_v2 = next_v2.left
      elsif v2 > next_v2.val
        next_v2 = next_v2.right
      end
    end

    if next_v1 == next_v2.parent
      next_v1
    elsif next_v2 == next_v1.parent
      next_v2
    else
      next_v1.parent
    end
  end
end

t = Tree.new

[30, 8, 52, 3, 20, 10, 29].each { |v| t.insert(v) }

File.open(ARGV[0]).each_line do |line|
  v1, v2 = line.strip.split(' ').map(&:to_i)

  # version 1: if node can have depth information
  #n1 = t.find(v1)
  #n2 = t.find(v2)
  #while(n1.val != n2.val)
  #  if n1.depth < n2.depth
  #    n2 = n2.parent
  #  else
  #    n1 = n1.parent
  #  end
  #end
  #puts n1.val

  # version 2: if tree provides a method to find common ancestor
  puts t.common_ancestor(v1, v2).val
end