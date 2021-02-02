
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

  def self.contains?(head, value)
    return true if head.data == value

    head = contains?(head.next_node, value) unless head.next_node.nil?
    return false if head == false
    return true if head == true
    return false if head.next_node.nil?
  end

  def self.find(head, value, i=-1)
    head = find(head.next_node, value, i + 1) unless head.next_node.nil? || head.data == value
    return nil unless head.instance_of?(Node) || head.is_a?(Integer)
    return head if head.is_a?(Integer)
    return i if head.data == value
  end

  def self.to_s(head)
    string = to_s(head.next_node) unless head.next_node.nil?
    unless string.instance_of?(Node)
      return "( #{head.data} ) -> nil" if head.next_node.nil?
      return string if head.data.nil?

      return "( #{head.data} ) -> #{string}"
    end
    return "( #{head.data} ) -> nil" if head.next_node.nil?
  end

  def self.insert_at(head, index, value, i=-1)
    return Node.new(value, head.next_node) if index.negative?

    head.next_node = insert_at(head.next_node, index, value, i + 1) unless head.nil? || index == i
    return Node.new(value, head) if index == i
    return Node.new(value, nil) if head.nil?

    head
  end

  def self.remove_at(head, index, i=-1)
    head.next_node = remove_at(head.next_node, index, i + 1) unless head.next_node.nil? || index == i
    return head.next_node if index == i
    return nil if head.next_node.nil? && index == i
    return head if head.next_node.nil?

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
  p 'list contains value'
  p contains?(head, 'two')
  p 'list doesn\'t contain value'
  p contains?(head, 'seven')
  puts 'index of "one"'
  p find(head, 'one')
  p 'to string'
  p to_s(head)
  puts 'insert "one.five" in between one and two'
  p insert_at(head, 2, 'one.five')
  puts 'remove "one.five"'
  p remove_at(head, 3)
  p to_s(head)
end

LinkedLists.new
