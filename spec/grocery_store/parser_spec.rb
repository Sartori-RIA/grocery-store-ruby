# frozen_string_literal: true

require "spec_helper"

RSpec.describe GroceryStore::Parser do
  it "parses input lines into order with correct item count" do
    lines = ["2 book at 12.49"]
    order = described_class.parse(lines)
    expect(order.items.size).to eq(2)
  end
end
