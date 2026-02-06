#  frozen_string_literal: true

require_relative '../../lib/helpers/TaxCalculator'
require_relative '../../lib/helpers/CategoryResolver'
require_relative '../../lib/models/OrderItem'

describe TaxCalculator do
  describe "#self.calculate" do
    let(:random_category) { CategoryResolver::CATEGORIES.keys.sample }
    let(:random_item) { CategoryResolver::CATEGORIES[random_category].sample }

    it "return 0 when is tax free item" do
      item = OrderItem.new("1 #{random_item} at 20")
      expect(described_class.calculate(item)).to eq 0
    end

    it "add base tax when is item in other category" do
      item = OrderItem.new("1 amazing PS5 at 1000")
      expect(described_class.calculate(item)).to eq 100.0
    end

    it "add additional tax when is imported item" do
      item = OrderItem.new("1 imported amazing PS5 at 1000")
      expect(described_class.calculate(item)).to eq 150.0
    end
  end
end