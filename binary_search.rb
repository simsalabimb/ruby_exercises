class Node
    attr :value, :left, :right
            
    def initialize(value, left = nil, right = nil) 
        @value = value 
        @left = left
        @right = right
    end

    def add(next_value)
        if @value > next_value
        if @left
            @left.add(next_value)
        else
            @left = Node.new(next_value)
        end # if left
        elsif @value < next_value
        if @right
            @right.add(next_value)
        else
            @right = Node.new(next_value)
        end #if right
        end #big if
    end # def add end
end

class Tree

    attr_reader :root

    def initialize
        @root = nil
    end


    def build_tree(arr)
        arr.uniq!

        @root = Node.new(arr.shift)
        arr.each { |n| @root.add(n)}
        @root
    end

    def insert(num)
        @root.add(num)
    end

    def find(value)
        return nil if @root.nil?
        return find_node(@root, value)
    end

    def find_node(node, value)
        return nil if node.nil?
        if value == node.value
        node
        elsif value < node.value
        find_node(node.left, value)
        elsif value > node.value
        find_node(node.right, value)
        else
        #nil
        end
    end

    def breadthFirst
        queue = []
        output = []
        queue.push(@root)
        
        while(!queue.empty?)
        current = queue.shift

        queue.push(current.left) if current.left
        queue.push(current.right) if current.right

        output.push(current.value)

        end
        puts "Breadth-first traversal: "
        puts output.join(" ")

    end
    
end #tree class end 
  
sample = [5,6,2,4,1,8,7,10,3]

tree = Tree.new
tree.build_tree(sample)
tree.insert(9)
tree.breadthFirst
puts tree.find(9).value