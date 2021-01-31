
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

  def self.append(head, value, i = 0)
    until head.next_node == nil
      new_node = head.next_node
      p i
      sleep 1
      p "new_node"
      p new_node
      p "head.next_node.nil?"
      p head.next_node.nil?
      p "head.next_node "
      p head.next_node
      puts "head"
      p head
      head = self.append(new_node, value, i + 1)
    end
    p "I: #{i}"
    # puts 'finished' while true
    head.next_node = Node.new(value)
    head
    # head.next_node.next_node.next_node = Node.new(value)
  end

  def prepend(value)

  end

  head = Node.new(@head, Node.new('one', Node.new('two', @tail)))

  p 'head'
  p head
  p 'two'
  p head.next_node.next_node.data
  head = append(head, 'three')
  p 'three'
  p head
  p head.next_node.next_node.next_node.data
end

LinkedLists.new
