# no consider performance, memory space. And use Ruby built-in API
#File.open(ARGV[0]) do |file|
  #n = file.readline.to_i
  #result = []
  #file.each_line do |line|
  #  result << line.strip if line.strip.length > 0
  #end
  #puts result.sort { |f,s| s.length <=> f.length }[0...n]
#end

# consider performance, memory space and no use Ruby built-in API. Longer length but more efficient
class Node
  attr_accessor :str, :left, :right, :parent

  def initialize(str, parent = nil)
    @str, @left, @right = str, nil, nil
    @parent = parent
  end

  def val
    @str.nil? ? 0 : @str.length
  end
end

class Tree
  attr_accessor :size

  def initialize
    @root = nil
    @size = 0
  end

  def insert(newStr, parent = @root)
    if parent.nil?
      @root = Node.new(newStr)
      @size = 1
    else
      if parent.val < newStr.length
        if parent.right.nil?
          parent.right = Node.new(newStr, parent)
          @size += 1
        else
          insert(newStr, parent.right)
        end
      else
        if parent.left.nil?
          parent.left = Node.new(newStr, parent)
          @size += 1
        else
          insert(newStr, parent.left)
        end
      end
    end
    @root
  end

  def deleteMin(node = @root)
    unless node.nil?
      if node.left.nil?
        #current node is minimum one
        if node.parent
          node.parent.left = node.right
          node.right.parent = node.parent if node.right
        else
          #node is root
          node.right.parent = nil
          @root = node.right
        end
        @size -= 1
      else
        deleteMin(node.left)
      end
    end
  end

  def minValue(node = @root)
    node.left.nil? ? node.val : minValue(node.left)
  end

  def elements(node = @root, result = [])
    elements(node.right, result) if node.right
    result << node.str
    elements(node.left, result) if node.left

    result
  end
end

File.open(ARGV[0]) do |file|
  n = file.readline.to_i
  tree = Tree.new
  file.each_line do |line|
    line.strip!
    if line.length > 0
      if tree.size < n
        tree.insert(line)
      else
        if tree.minValue < line.length
          tree.deleteMin
          tree.insert(line)
        end
      end
    end
  end
  puts tree.elements
end