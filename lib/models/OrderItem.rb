# frozen_string_literal: true

require_relative '../helpers/CategoryResolver'
require_relative '../helpers/TaxCalculator'

class OrderItem
  attr_reader :quantity, :name, :price, :category, :imported

  def initialize(raw_input)
    @quantity = raw_input.split.first.to_i
    @imported = raw_input.include?('imported')

    name, _, price = raw_input.partition(' at ')
    @name = name
    @price = price.to_f
    @category = CategoryResolver.resolve(@name)
  end

  def tax
    TaxCalculator.calculate(self)
  end

  def total_price
    price + tax
  end
end
