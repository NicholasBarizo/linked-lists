
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

  def self.size(head, i=-1)
    i += 1
    head = size(head.next_node, i) unless head.next_node.nil?
    head.is_a?(Integer) ? head : i
  end

  def self.head_value(head)
    head.next_node.data
  end

  def self.tail_value(head)
    head = tail_value(head.next_node) unless head.next_node.nil?
    head.instance_of?(Node) ? head.data : head
  end

  def self.at(head, index, i=-1)
    i += 1
    head = at(head.next_node, index, i) unless i == index
    return head unless i == index

    head.data if i == index
  end

  def self.pop(head)
    if head.next_node.nil?
      head = nil
    else
      head.next_node = pop(head.next_node)
    end
    head
  end

  head = Node.new(@head, Node.new('one', Node.new('two', @tail)))
  head = append(head, 'three')
  p 'append three:'
  p head
  head = prepend(head, 'zero')
  p 'append zero'
  p head
  p 'get size'
  p size(head)
  p 'data of first node'
  p head_value(head)
  p 'data of last node'
  p tail_value(head)
  p 'data of third index:'
  p at(head, 3)
  p pop(head)
  p 'last node removed'
  p head
end

LinkedLists.new
