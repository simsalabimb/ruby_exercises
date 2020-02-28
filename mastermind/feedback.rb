def feedback(secret_key, guess)
    match = 0
    incorrect_position = 0
    unique_arr = guess.uniq
  
    secret_key.each_with_index do |num, index|
      if num == guess[index]
        match +=1
        incorrect_position = incorrect_position -1
      end
     end
  
    unique_arr.each do |num|
      incorrect_position +=1 if secret_key.include?num
    end
  
      puts "Matches #{match}  Incorrect Position #{incorrect_position}"
      
      return match
  end