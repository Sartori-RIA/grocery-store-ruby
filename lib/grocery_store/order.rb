# frozen_string_literal: true

require 'mutex_m'

module GroceryStore
  class Order
    attr_reader :items

    def initialize
      @items = []
      @mutex = Mutex.new
    end

    def add_item(item)
      @mutex.synchronize { @items << item }
    end

    def group_by_name
      items.group_by(&:name)
    end

    def total_tax
      items.sum { |item| TaxCalculator.calculate(item) }
    end

    def total
      items.sum { |item| item.price + TaxCalculator.calculate(item) }
    end
  end
end
