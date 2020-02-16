def stock_picker(arr)

  profit = 0
  i = 0
  buy_day = 0
  sell_day = 0

  arr.each do |price|
    i = arr.index(price)+1
      while i < arr.length
        sales_price = arr[i]

        if sales_price-price>profit
          profit = sales_price
          buy_day = arr.index(price)
          sell_day = arr.index(sales_price)
        end
        i+=1
      end
  end
   puts "The best day to buy/sell is #{buy_day} and #{sell_day}"
end


stock_picker([17,3,6,9,15,8,6,1,10])
stock_picker([17,23,6,9,15,8,6,13,1,27,6,9])