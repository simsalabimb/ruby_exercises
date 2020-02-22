def bubble_sort(arr)
    i = 0;
  while swapped
    i = 0;
    swapped = false
    while i<arr.length-1
        if arr[i] > arr[i+1]
        arr[i], arr[i+1] = arr[i+1], arr[i]
        swapped = true
        end 
        i+=1
    end
  end
end

def bubble_sort_by(arr)
    i=0
  
      while i < arr.length-1
          temp = yield(arr[i], arr[i+1])
  
          arr[i], arr[i+1] = arr[i+1], arr[i] if temp >0
           i+=1
      end 
      return arr
  end
  
  bubble_sort([4,3,78,2,0,2])

  bubble_sort_by(["hi","hello","hey"]) do |left,right|
      left.length - right.length
  end