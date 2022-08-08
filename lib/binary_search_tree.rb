# frozen_string_literal: true

class Node
  require 'Comparable'
  attr_accessor :data, :left_child, :right_child
end

class Tree
  attr_accessor :root

  def initialize(array)
    @root = build_tree(array)
  end
  def build_tree(array)
    
  end
end
