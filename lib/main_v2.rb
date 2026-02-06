puts "Welcome to Subscribe Grocery Store :D\n"

order = Order.new
OrderInput.read_items.each do |raw_item|
  order.add_item(raw_item)
end

OrderPrinter.print(order)
