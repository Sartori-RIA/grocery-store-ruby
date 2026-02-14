# frozen_string_literal: true

module GroceryStore
  class Receipt
    def initialize(order)
      @order = order
    end

    def print
      @order.group_by_name.each do |name, items|
        price_with_tax = items.map { |item| item.price + GroceryStore::TaxCalculator.calculate(item) }
        summed = price_with_tax.sum
        puts "#{items.size} #{name}: #{format('%.2f', summed)}"
      end

      puts "Sales Taxes: #{format('%.2f', @order.total_tax)}"
      puts "Total: #{format('%.2f', @order.total)}"
    end
  end
end

