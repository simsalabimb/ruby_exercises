require './game.rb'

def secret_word
  file = File.open("dictionary.txt")
  file_data = file.readlines  

  find_word = true

  while find_word
      key = rand(file_data.length)
      word = file_data[key].gsub!("\n","")
    if word.length >= 5 && word.length <=12
      find_word = false
      puts word
      return word
    end
  end
end




puts "Welcome to CLI style pacman! \n\n"
pacman = Game.new
pacman.play(secret_word)