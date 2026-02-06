# frozen_string_literal: true

class TaxCalculator
  BASIC_TAX = 0.10
  IMPORT_TAX = 0.05

  def self.calculate(item)
    tax = 0
    return tax if item.category != :other

    tax += item.price * BASIC_TAX
    tax += item.price * IMPORT_TAX if item.imported

    tax
  end
end
