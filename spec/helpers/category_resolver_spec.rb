# frozen_string_literal: true

require 'spec_helper'

RSpec.describe CategoryResolver do
  describe "#constants" do
    it { expect(described_class::CATEGORIES.keys).to eq(%i[book food medical]) }
    it { expect(described_class::CATEGORIES[:book]).to eq(%w[book books novel textbook]) }
    it { expect(described_class::CATEGORIES[:medical]).to eq(%w[pill pills headache medicine syrup]) }
    it { expect(described_class::CATEGORIES[:food]).to eq(["chocolate", "chocolates", "bread", "cake", "apple", "hot dog", "hot-dog", "pizza", "meat", "rice", "beans", "burger"]) }
  end

  describe "#self.resolve" do
    it "return the category other" do
      expect(described_class.resolve("amazing PS5")).to eq(:other)
    end

    it "return the category food" do
      expect(described_class.resolve(described_class::CATEGORIES[:food].sample)).to eq(:food)
    end

    it "return the category book" do
      expect(described_class.resolve(described_class::CATEGORIES[:book].sample)).to eq(:book)
    end

    it "return the category medical" do
      expect(described_class.resolve(described_class::CATEGORIES[:medical].sample)).to eq(:medical)
    end
  end
end