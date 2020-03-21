class Node
    attr_accessor :value, :next_node
  
    def initialize(value, next_node)
      @value = value
      @next_node = next_node
    end
end
  
class LinkedList
  
    def initialize
      @head = nil
      @tail = nil
    end
  
    def empty?
      @head == nil
    end
  
    def append(value)
      if empty?
        @head = @tail = Node.new(value, nil)
      else 
        new_node = Node.new(value, nil)
        @tail.next_node = new_node
        @tail = new_node
      end
    end
  
    def prepend(value)
      if empty?
        @head = @tail = Node.new(value, nil)
      else 
        new_node = Node.new(value, @head)
        @head = new_node
      end
    end
  
    def size
      cursor = @head 
      counter = 0
      while cursor != nil
        counter+=1
        cursor = cursor.next_node
      end
      counter
    end
  
    def head
      @head.value
    end
  
    def tail
      @tail.value
    end
  
    def at(index)
      counter = 0
      node = @head
      if index < size
        while counter != index
          counter+=1
          node = node.next_node
        end
        node.value
      else
        puts "Index not present"
      end
    end
  
    def contains?(value)
      node = @head
      contain = false
        while node != nil
          if value == node.value
            contain = true
            break
          end
          node = node.next_node
        end
        contain ? true : false
    end
  
    def pop
      node = @head
      prev_node = nil
  
      until node.next_node.nil?
        prev_node = node
        node = node.next_node
      end
      prev_node.next_node = nil
      node
    end
  
    def to_s
      cursor = @head 
      while cursor != nil
        print "#{cursor.value} -> "
        cursor = cursor.next_node
      end
  
      print "\n"
    end
end
  
  my_list = LinkedList.new
  my_list.prepend(5)
  my_list.prepend(4)
  my_list.prepend(3)
  my_list.append(6)
  my_list.prepend(1)
  
  my_list.to_s
  my_list.pop
  
  my_list.to_s
  
  #my_list.to_s
  #puts my_list.at(2)
  #puts my_list.contains?(6)