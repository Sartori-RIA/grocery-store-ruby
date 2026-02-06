# frozen_string_literal: true

CATEGORIES = {
  book: %w[book books novel textbook],
  food: ['chocolate', 'chocolates', 'bread', 'cake', 'apple', 'hot dog', 'hot-dog', 'pizza',
         'meat', 'rice', 'beans'],
  medical: %w[pill pills headache medicine syrup]
}.freeze

def add_items(input: Kernel)
  items = []

  loop do
    print "Please Add Item to the order:\n"
    items << input.gets.chomp

    print "Add more? (y/n)\n"
    break if input.gets.chomp.to_s.downcase != 'y'
  end

  items
end

def categorize(item_name)
  puts item_name
  normalized = item_name.downcase

  CATEGORIES.each do |category, keywords|
    return category if keywords.any? { |word| normalized.include?(word) }
  end

  :other
end

def format_order_items(items)
  items.map do |item|
    quantity = item.split[0].to_i
    is_imported = item.include?('imported')
    name, _, price = item.partition(' at ')

    { quantity:, name:, is_imported:, price: price.to_f, category: categorize(name) }
  end
end

def sum_order_values(items_formatted)
  taxes = 0
  total = 0
  items_formatted.each do |item|
    total += item[:price]
    next if item[:category] != :other

    taxes += item[:price] * 0.1
    taxes += item[:is_imported] ? item[:price] * 0.05 : 0
  end
  [taxes, total + taxes]
end

def print_order(items, taxes, total)
  print "====*====*====*====*====*====*====*====*====*\n\n"
  print items.map { |i| "#{i[:name]}: #{i[:price]}" }.join("\n")
  print "\n\nSale Taxes: #{taxes}\n"
  print "Total: #{total}\n\n"
  print "====*====*====*====*====*====*====*====*====*\n\n"
  print "Thanks for buying with us, have a nice day XD\n"
  print "====*====*====*====*====*====*====*====*====*\n\n"
end

def welcome
  print "Welcome to Subscribe Grocery Story :D\n"
end

if __FILE__ == $PROGRAM_NAME
  welcome
  items = add_items
  formatted_items = format_order_items(items)
  taxes, total = sum_order_values(formatted_items)
  print_order(formatted_items, taxes, total)
end
