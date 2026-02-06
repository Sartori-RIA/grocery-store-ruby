# frozen_string_literal: true

class OrderPrinter
  def self.render(order)
    print "====*====*====*====*====*====*====*====*====*\n\n"
    print order.items.map { |i| "#{i.name}: #{i.price}" }.join("\n")
    print "\n\nSale Taxes: #{order.taxes}\n"
    print "Total: #{order.total}\n\n"
    print "====*====*====*====*====*====*====*====*====*\n\n"
    print "Thanks for buying with us, have a nice day XD\n"
    print "====*====*====*====*====*====*====*====*====*\n\n"
  end
end