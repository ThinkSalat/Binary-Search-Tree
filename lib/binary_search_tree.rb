require_relative 'bst_node'
# There are many ways to implement these methods, feel free to add arguments 
# to methods as you see fit, or to create helper methods.

class BinarySearchTree
  attr_accessor :root
  def initialize
    @root = nil
  end

  def insert(value)
    node = BSTNode.new(value)
    if @root
      @root.insert(node)
    else
      @root = node
    end
  end

  def find(value, tree_node = @root)
    return tree_node if tree_node.value == value
    if  tree_node.value > value && tree_node.left
      find(value,tree_node.left)
    elsif tree_node.value < value && tree_node.right
      find(value, tree_node.right)
    else
      nil
    end
  end

  def delete(value)
    # Delete root if root is target
    if @root.value == value
      @root = nil 
      return
    end

    # Find the node to be deleted
    node = find(value)
    # count its children as different numbers of children will have different methods to delete
    child_count = [node.left, node.right].count{|el| el}
    case child_count
    when 0
      if node.value < node.parent.value
        node.parent.left = nil 
      else
        node.parent.right = nil 
      end
    when 1
      if node.value < node.parent.value
        node.parent.left = node.left 
        node.left.parent = node.parent
      else
        node.parent.right = node.right
        node.right.parent = node.parent
      end
    when 2
      replacement_node = maximum(node.left)
      replacement_node.parent.right = replacement_node.left
      replacement_node.parent = node.parent
      if node.value < node.parent.value
        node.parent.left = replacement_node
      else
        node.parent.right = replacement_node 
      end
    end
  end

  # helper method for #delete:
  def maximum(tree_node = @root)
    if tree_node.right
      maximum(tree_node.right)
    else
      tree_node
    end
  end

  def depth(tree_node = @root)
    # Base Case, depth is 0
    return 0 unless tree_node.left || tree_node.right
    
    depth = 1
    child_count = [tree_node.left, tree_node.right].count{|el| el}
    if child_count == 2
      right_depth = depth(tree_node.right)
      left_depth = depth(tree_node.left)
      depth + [right_depth, left_depth].max
    else
      if tree_node.left
        depth + depth(tree_node.left)
      else
        depth + depth(tree_node.right)
      end
    end
  end 

  def is_balanced?(tree_node = @root)
    depth(tree_node.left) == depth(tree_node.right)
  end

  def in_order_traversal(tree_node = @root, arr = [])
    return arr if tree_node.nil?
    in_order_traversal(tree_node.left, arr)
    arr << tree_node.value
    in_order_traversal(tree_node.right, arr)
  end
  
  private
  # optional helper methods go here:

end
