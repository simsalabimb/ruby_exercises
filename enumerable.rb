
https://github.com/niconisoria/project_building_blocks/blob/master/enumerable_methods.rb
module Enumerable
    def my_each
      for x in self
        yield x
      end

    end

    def my_each_with_index
        i = 0
        for x in self
            yield x,i
        end
    end
    def my_select
        self.class == Hash ? selected_arr = {} : selected_arr = []
        
        self.my_each do |n|
          if yield(n)
            selected_arr << n
          end
        end
        selected_arr
    end
    def my_all?
        test = true
      
        self.my_each do |n|
          if yield(n) == false
            test = false
          end
        end
        test
      end



  end #module end
  


#each
my_array = (1..3).to_a
my_array.each{ |num| puts num }
puts "-----My Method Below--------"
my_array.my_each{ |num| puts num}

#each_with_index
colors = ['red', 'green', 'blue']
colors.each_with_index { |item, index| puts "#{index}:#{item}" }
puts "-----My Method Below--------"
colors.my_each_with_index { |item, index| puts "#{index}:#{item}" }

#select
[1,2,3,4,5,6].my_select { |n| n%2==0 }

#all
%w[ant bear cat].all? { |word| word.length >= 4 }
%w[ant bear cat].my_all? { |word| word.length >= 4}