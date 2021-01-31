
class Node
  attr_accessor :data, :next_node

  def initialize(data = nil, next_node = nil)
    @data = data
    @next_node = next_node
  end
end

class LinkedLists
  def initialize
    @head = nil
    @tail = nil
  end

  def self.append(head, value)
    head.next_node = head.next_node.nil? ? Node.new(value) : append(head.next_node, value)
    head
  end

  def self.prepend(head, value)
    head.data = value
    Node.new(@head, head)
  end

  head = Node.new(@head, Node.new('one', Node.new('two', @tail)))
  head = append(head, 'three')
  p 'three'
  p head
  head = prepend(head, 'zero')
  p 'zero'
  p head
end

LinkedLists.new
