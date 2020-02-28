class Player

    attr_accessor :name
  
    def initialize(name)
      @name = name
    end
   
    def codebreaker #Worry about the computer logic later
      puts "#{@name}, guess the code: "
      user_guess = gets.chomp.split("").to_a
      user_guess = user_guess.map(&:to_i)
      return user_guess
    end
  
    def secret_key
      if @name == "computer"
        code = Array.new(4) { rand(1...8) }
      else
        puts "Input secret code: "
        code = gets.chomp.split("").to_a
      end
      return code
    end
  end