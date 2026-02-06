# frozen_string_literal: true

class OrderInput
  def self.read_items(input: Kernel)
    items = []

    loop do
      print "Please Add Item to the order:\n"
      items << input.gets.chomp

      print "Add more? (y/n)\n"
      break if input.gets.chomp.downcase != "y"
    end

    items
  end
end
