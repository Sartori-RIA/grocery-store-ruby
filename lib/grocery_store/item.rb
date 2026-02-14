# frozen_string_literal: true

module GroceryStore
  class Item
    attr_reader :name, :price, :imported, :exempt

    def initialize(name:, price:, imported: false, exempt: false)
      @name = name
      @price = price
      @imported = imported
      @exempt = exempt
    end
  end
end
