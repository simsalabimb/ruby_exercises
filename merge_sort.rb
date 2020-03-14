def merge_sort(arr)
    length = arr.length
    return arr if length <= 1
    left = arr[0, (length / 2)]
    right = arr[(length / 2), length]
  
    left = merge_sort(left)
    right = merge_sort(right)
    merge(left, right)
end
  
def merge(left,right)
    result = []
    i = 0
    j = 0
    while left.length > i && right.length > j
        if left[i] > right[j]
        result << right[j]
        j+=1
        else
        result << left[i]
        i+=1
        end
    end
    result << left[i] unless left[i] == nil
    result << right[j] unless right[j] == nil
    result
end
  
merge_sort([4,5,2,8,1,6,3,9])