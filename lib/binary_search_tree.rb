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
    p sort
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

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end
end

array = [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]
tree = Tree.new(array)
tree.insert(6)
p tree.root > tree.root.left

tree.pretty_print
