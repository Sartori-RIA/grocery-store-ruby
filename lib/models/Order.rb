# frozen_string_literal: true

require_relative 'OrderItem'

class Order
  attr_reader :items

  def initialize
    @items = []
  end

  def add_item(raw_input)
    @items << OrderItem.new(raw_input)
  end

  def taxes
    items.sum(&:tax)
  end

  def total
    items.sum(&:total_price)
  end
end
