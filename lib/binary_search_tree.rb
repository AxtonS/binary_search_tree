# frozen_string_literal: true

require 'pry-byebug'

# builds node objects to populate binary search tree
class Node
  attr_accessor :data, :left, :right

  include Comparable
  def <=>(other)
    data <=> other.data
  end

  def initialize(data, left = nil, right = nil)
    @data = data
    @left = left
    @right = right
  end
end

# sorts arrays and builds binary search tree with the data
class Tree
  attr_accessor :root

  def initialize(array)
    sort = array.uniq.sort
    @root = build_tree(sort)
  end

  def build_tree(array, head = 0, tail = array.length - 1)
    return nil if head > tail

    mid = (head + tail) / 2
    Node.new(array[mid], build_tree(array, head, mid - 1), build_tree(array, mid + 1, tail))
  end

  def insert(value, node = @root)
    return Node.new(value) if node.nil?

    if value < node.data
      node.left = insert(value, node.left)
    elsif value > node.data
      node.right = insert(value, node.right)
    end
    node
  end

  def delete(value, node = @root)
    return node if node.nil?

    if value < node.data
      node.left = delete(value, node.left)
    elsif value > node.data
      node.right = delete(value, node.right)
    else
      return node.right if node.left.nil?
      return node.left if node.right.nil?

      node.data = minimum(node.right)
      node.right = delete(node.data, node.right)
    end
    node
  end

  def minimum(node = @root)
    min = node.data
    until node.left.nil?
      min = node.left.data
      node = node.left
    end
    min
  end

  def find(value, node = @root)
    return node if node.nil?

    if value < node.data
      find(value, node.left)
    elsif value > node.data
      find(value, node.right)
    else
      node
    end
  end

  def level_order
    queue = [@root]
    array = []
    until queue.empty?
      queue.push << queue[0].left unless queue[0].left.nil?
      queue.push << queue[0].right unless queue[0].right.nil?
      array.push << queue.shift
    end
    if block_given?
      return array.map { |node| yield node }
    end
    array.map { |node| node.data }
  end

  def preorder(node = @root)
    array = [node]
    array.push << preorder(node.left) unless node.left.nil?
    array.push << preorder(node.right) unless node.right.nil?
    if block_given?
      return array.map { |node| yield node }
    end
    return array unless node == @root
    array.flatten.map { |node| node.data }
  end

  def inorder(node = @root)
    array = []
    array.push << inorder(node.left) unless node.left.nil?
    array.push node
    array.push << inorder(node.right) unless node.right.nil?
    if block_given?
      return array.map { |node| yield node }
    end
    return array unless node == @root
    array.flatten.map { |node| node.data }
  end

  def postorder(node = @root)
    array = []
    array.push << postorder(node.right) unless node.right.nil?
    array.push << postorder(node.left) unless node.left.nil?
    array.push node
    if block_given?
      return array.map { |node| yield node }
    end
    return array unless node == @root
    array.flatten.map { |node| node.data }
  end

  def height(node = @root)
    return 0 if node.nil?

    left = height(node.left)
    right = height(node.right)
    if left > right
      return left + 1
    else
      right + 1
    end
  end

  def depth(node, root = @root, count = 1)
    return 0 if node.nil?

    if node.data < root.data
      count = depth(node, root.left, count += 1)
    elsif node.data > root.data
      count = depth(node, root.right, count += 1)
    else
      count
    end
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end
end

array = [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]
tree = Tree.new(array)
puts tree.pretty_print
puts tree.depth(tree.find(4))
