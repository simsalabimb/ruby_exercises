def caesar_cipher(str, num)
    alphabet = ('a'..'z').to_a
    arr = str.split('')
    ans = []
    i = 0
  
    arr.each do |letter|
  
     case_changed = false
      if letter.upcase == letter  
          letter = letter.downcase
          case_changed = true
      end
      
      if alphabet.include? letter 
        temp = alphabet[(alphabet.index(letter) + num) % alphabet.size] #use modulo to wrap array. If there is remainder, then array will wrap the beginning
        if case_changed
          temp = temp.upcase
        end
        ans[i]=temp
      else 
        ans[i] = letter
      end
      i += 1 
    end 
    str = ans.join('')
    puts str
  
  end
  
  caesar_cipher("What a tIme!", 5)
  caesar_cipher("works wiTh NegaT!ve", -4)