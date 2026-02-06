# frozen_string_literal: true

require_relative 'models/Order'
require_relative 'helpers/OrderInput'
require_relative 'helpers/OrderPrinter'

print "Welcome to Subscribe Grocery Store :D\n"

order = Order.new
OrderInput.read_items.each do |raw_item|
  order.add_item(raw_item)
end

OrderPrinter.print(order)
