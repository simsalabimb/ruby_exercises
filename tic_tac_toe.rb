class Player

    def initialize
    end
  
    def play
      puts "Enter number 1-9: "
      choice = gets.chomp
      return choice
    end
  end
  
  def display(board)
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts "-----------"
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts "-----------"
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
  end
  
  def three_in_a_row(board)
    if board[0] == board[1] && board[0] == board[2] && board[0] != nil
      return true
    elsif board[0] == board[3] && board[0] == board [6] && board[0] != nil
      return true
    elsif board[0] == board[4] && board[0] == board[8] && board[0] != nil
      return true
    elsif board[1] == board[4] && board[1] == board[7] && board[1] != nil
      return true
    elsif board[2] == board[5] && board[2] == board[8] && board[2] != nil
      return true
    elsif board[2] == board[4] && board[2] == board[6] && board[2] != nil
        return true
    elsif board[3] == board[4] && board[3] == board[5] && board[3] != nil
      return true
    elsif board[6] == board[7] && board[6] == board[8] && board[6] != nil
      return true
    else
      return false
    end
  end
  
  def play_round(board)
  
    i = 0
    grid_item = 0
    turn = 2
    player = Player.new
    check = true
  
    gameover = false
  
    while !gameover
     tie = board.all? {|num| num!=nil}
     if tie
      break
     end
  
      display(board)
      choice = player.play.to_i
      choice = choice - 1
  
        if board[choice] == nil
            if turn % 2 == 0
              board[choice] = "x"
              turn+=1
            else
              board[choice] = "o"
              turn+=1
            end
        else
          puts "Invalid choice, choose again\n"
  
        end
        gameover = three_in_a_row(board)
    end
  
    if turn % 2 == 0 && gameover
      puts "Player 1 has won!"
    elsif turn % 2 != 0 && gameover
      puts "Player 2 has won!"
    else
      puts "it was a draw :/ "
    end
  end
  
  puts "Tic-tac-toe will be played on a 3 x 3 grid. You will have the options to select the corresponding number for the spot you would like to enter. Example below: \n\n"
  puts " 1 | 2 | 3 "
  puts "-----------"
  puts " 4 | 5 | 6 "
  puts "-----------"
  puts " 7 | 8 | 9 "
  
  puts "\n\n"
  board = Array.new(9,nil)
  play_round(board)
  