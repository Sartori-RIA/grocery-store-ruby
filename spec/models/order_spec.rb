# frozen_string_literal: true

require_relative '../../lib/models/Order'

describe Order do
  describe "#initialize" do
    it "initializes items empty" do
      order = described_class.new
      expect(order.items).to eq []
    end
  end

  describe "#add_item" do
    it "adds an OrderItem to the order" do
      order = described_class.new

      expect {
        order.add_item("1 book at 10")
      }.to change(order.items, :size).by(1)

      expect(order.items.first).to be_an(OrderItem)
    end
  end

  describe "#taxes" do
    it "returns the sum of taxes for all items" do
      order = described_class.new
      order.add_item("1 book at 10") # tax-free
      order.add_item("1 imported PS5 at 1000") # basic tax + import tax

      expect(order.taxes).to eq(150)
    end
  end

  describe "#total" do
    it "returns the total price including taxes" do
      order = described_class.new
      order.add_item("1 book at 10")
      order.add_item("1 imported PS5 at 1000")

      # 10 + 1000 + 150
      expect(order.total).to eq(1160)
    end
  end
end