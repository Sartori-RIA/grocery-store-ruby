# frozen_string_literal: true

class OrderInput
  def self.read_items
    items = []

    loop do
      print "Please Add Item to the order:\n"
      items << gets.chomp

      print "Add more? (y/n)\n"
      break if gets.chomp.downcase != "y"
    end

    items
  end
end
