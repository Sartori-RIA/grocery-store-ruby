# frozen_string_literal: true

require "spec_helper"

RSpec.describe GroceryStore::TaxCalculator do
  let(:book) { GroceryStore::Item.new(name: "book", price: 12.49, exempt: true) }
  let(:music_cd) { GroceryStore::Item.new(name: "music CD", price: 14.99) }
  let(:imported_perfume) do
    GroceryStore::Item.new(name: "imported perfume", price: 47.50, imported: true)
  end

  it "does not apply tax to exempt items" do
    expect(described_class.calculate(book)).to eq(0)
  end

  it "applies basic tax" do
    expect(described_class.calculate(music_cd)).to eq(1.50)
  end

  it "applies import duty and rounds correctly" do
    expect(described_class.calculate(imported_perfume)).to eq(7.15)
  end
end
