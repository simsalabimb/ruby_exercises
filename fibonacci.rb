#using enumerator to loop
def fib_loop(n)
    arr = []
    (0...n).each do |n|
      arr << n if n <=1
      arr << arr[-1] + arr[-2] unless n<=1
    end
    arr
  end
  
  #using recursion 
  def fibs_rec(n)
    return [n] if n <=1
    fibs_rec(n-1) << fibs_rec(n-1)[-1] + fibs_rec(n-2)[-1]
  end
  
fib_loop(8)
fibs_rec(8)