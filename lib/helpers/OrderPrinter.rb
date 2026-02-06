# frozen_string_literal: true

class OrderPrinter
  def self.print(order)
    puts "====*====*====*====*====*====*====*====*====*\n"

    order.items.each do |item|
      puts "#{item.name}: #{item.price}"
    end

    puts "\nSale Taxes: #{order.taxes}"
    puts "Total: #{order.total}\n"

    puts "Thanks for buying with us, have a nice day XD"
    puts "====*====*====*====*====*====*====*====*====*\n"
  end
end