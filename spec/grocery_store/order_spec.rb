# frozen_string_literal: true

require "spec_helper"

RSpec.describe GroceryStore::Order do
  it "calculates total including taxes" do
    order = described_class.new
    order.add_item(GroceryStore::Item.new(name: "CD", price: 10.00))
    expect(order.total).to be > 10.00
  end
end
