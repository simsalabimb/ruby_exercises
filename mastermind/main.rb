require './player.rb'
require './feedback.rb'


def game
  print "Enter your name: "
  name = gets.chomp

  decoder = Player.new(name)
  encoder = Player.new("computer")
  code = encoder.secret_key
  round = 1
  gameon = true

  while round <= 12 && gameon
    puts "----Round #{round}----"
 
    guess = decoder.codebreaker
    match = feedback(code, guess)

    if match == 4
      puts "Congrats you won!"
      gameon = false
    end
    round +=1
  end

  puts "The code was #{code}" if gameon == true
  play_again

end

def play_again
  puts "Want to play again? Y/N"
  choice = gets.chomp
  if choice == "Y"
    game 
  else
    puts "See you later!"
  end
end

puts "\n Welcome to the command line version of mastermind. For typing sake, we will be using numbers instead of colors for guessing the codes. The rules are simple: enter a 4 digit code and the prompt will provide feedback. Numbers can be repeated and are only from 1-9. You will have 12 tries to guess the code.\n\n"

puts "Good Luck! \n\n"

game