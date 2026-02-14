# frozen_string_literal: true

module GroceryStore
  class TaxCalculator
    BASIC_TAX = 0.10
    IMPORT_DUTY = 0.05

    def self.calculate(item)
      tax = 0
      tax += item.price * BASIC_TAX unless item.exempt
      tax += item.price * IMPORT_DUTY if item.imported
      round_up(tax)
    end

    def self.round_up(amount)
      (amount * 20).ceil / 20.0
    end
  end
end
