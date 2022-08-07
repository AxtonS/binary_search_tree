# binary_search_tree
learning binary search trees in ruby

## To-do  
-Build a node class with the attributes data, left and right child.  
-Add the comparable module to compare nodes data.  
-Build tree class which accepts an array when initialized, it should have a root attribute that uses the return value of build_tree method.  
-Write the build_tree method which takes an array of data and turns it into a balanced binary tree full of node objects after sorting the array and removing duplicates, this method should return the level-0 root node.  
-Write insert and delete methods that accepts a value to insert or delete.  
-Write a find method which returns the node with the given value.  
-Write a level_order method which accepts a block. The method should traverse the tree in breadth-first level order and yield each node to the given block. The method should return an array of values if no block is given.  
-Write inorder, preorder, and postorder methods that accepts blocks. Each method traverses the tree in depth-first order and yield each node to the provided block. The methods should return an array of values if no block is given.  
-Write a height method which accepts a node and returns the number of edges in longest path from given node to a leaf node.  
-Write a depth method which accepts a node and returns the number of edges in path from given node to the root node.  
-Write a balanced? method which checks if the difference between heights of left and right subtree of every node is not more than 1.  
-Write a rebalance method which rebalances an unbalanced tree using a traversal method to provide a new array to build_tree method.  
-Write a driver script to do the following:  
  -Create a binary search tree from array of random numbers.  
  -Confirm that the tree is balanced using balanced? method.  
  -Print out all elements in level, pre, post, and in order.  
  -Unbalance the tree by adding several numbers over 100.  
  -Confirm that the tree is unbalanced using balanced? method.  
  -Balance the tree by calling rebalance method.  
  -Confirm the tree is balanced with balanced? method.  
  -Print out all elements in level, pre, post, and in order.  
-Add pretty_print method to visualize the binary search tree:  
  def pretty_print(node = @root, prefix = '', is_left = true)
  pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
  puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
  pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end
