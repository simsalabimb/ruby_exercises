class Game

  @@id = 0
  @save = false
  
  def initialize
    @@id+=1
  end

  def save(word, wrong, blanks)
    filename = "saved_games/#{@@id}.txt"

    File.open(filename,'w') do |file|
        file.print "#{word}\n#{wrong}\n#{blanks}"
    end
  end

  def load
    puts "Which game would you like to load?"
    puts Dir.entries("saved_games")
    id = gets.chomp.to_i

    file = File.open("saved_games/#{id}.txt")
    file_data = file.readlines
    return file_data
  end

  def play(word)
    puts "Do you want to play a 'new' game or 'load' a previous game? \n"

    decision = gets.chomp
    if decision == "load"
      regex = /[a-z_]/
      data = load

      word = data[0].delete! "\n"
      wrong = data[1].scan(regex)
      blanks = data[2].scan(regex)
      
    else 
      blanks = Array.new(word.length,"_")
      wrong = []
      word = word.downcase
    end

    while wrong.length < 6 && blanks.any?("_")
    blanks.each {|letter| print "#{letter} "}
    puts ""
      print "GUESSES: #{wrong} \n\n"
      puts "Guess a letter: "
      guess = gets.chomp
      i=0

      if guess == "save"
        save(word, wrong, blanks)
        @save = true
        break
      end

      word.each_char do |letter|
        if letter == guess
          blanks[i] = guess
        elsif word.include?(guess) == false
          wrong.push(guess) unless wrong.include?(guess)
        end
        i+=1
      end
      
      puts ""
    end #while
      if blanks.any?("_") == false
        puts "You got it!"
      elsif @save == true
        puts "Your game has been saved as #{@@id}.txt"
      else
        puts "Womp, womp. You lost! The word was #{secret_word}"
      end
  end #play end
end #class end
