require_relative 'binary_search_tree'

def kth_largest(tree_node, k)
  tree = BinarySearchTree.new
  tree.root = tree_node
  arr = tree.in_order_traversal
  tree.find(arr[-k])
end
