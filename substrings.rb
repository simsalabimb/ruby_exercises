def substrings(str, dictionary)  

    arr = str.downcase.split("")
    word_matches = []
  
    arr.each do |c|
      i = arr.index(c)
      word = ""
      new_arr = []
  
      while i < arr.length
        new_arr = new_arr.push(arr[i])
        word = new_arr.join("")

          if dictionary.include? word
            word_matches = word_matches.push(word)
          end

        i+=1
      end
    end
  
    counts = Hash.new(0)
    word_matches.each { |name| counts[name] += 1 }
    puts counts
  
  end 
  
  
  dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
  
  substrings("below", dictionary)
  substrings("Howdy partner, sit down! How is it going?", dictionary)