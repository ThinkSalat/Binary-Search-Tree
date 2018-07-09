class BSTNode
  attr_accessor :value, :left, :right, :parent
  def initialize(value)
    @value = value
    @left, @right = nil, nil
    @parent = nil
  end

  def insert(node)
    if @value > node.value
      if @left
        @left.insert(node)
      else
        @left = node 
        @left.parent = self
      end
    else
      if @right
        @right.insert(node)
      else
        @right = node
        @right.parent = self
      end
    end
  end
end
