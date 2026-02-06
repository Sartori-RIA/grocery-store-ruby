# frozen_string_literal: true

require 'spec_helper'

RSpec.describe OrderItem do
  let!(:tax_free_item) { described_class.new("1 book at 10") }
  let!(:basic_tax_item) { described_class.new("1 ps5 at 1000") }
  let!(:import_tax_item) { described_class.new("1 imported ps5 at 1000") }

  describe "#initialize" do
    it "set initial values for tax-free items" do
      expect(tax_free_item.quantity).to eq 1
      expect(tax_free_item.imported).to be_falsey
      expect(tax_free_item.name).to eq "1 book"
      expect(tax_free_item.price).to eq 10.0
      expect(tax_free_item.category).to eq :book
    end

    it "set initial values for basic tax items" do
      expect(basic_tax_item.quantity).to eq 1
      expect(basic_tax_item.imported).to be_falsey
      expect(basic_tax_item.name).to eq "1 ps5"
      expect(basic_tax_item.price).to eq 1000.0
      expect(basic_tax_item.category).to eq :other
    end

    it "set initial values for import tax items" do
      expect(import_tax_item.quantity).to eq 1
      expect(import_tax_item.imported).to be_truthy
      expect(import_tax_item.name).to eq "1 imported ps5"
      expect(import_tax_item.price).to eq 1000.0
      expect(import_tax_item.category).to eq :other
    end
  end

  describe "#tax" do
    it "calculates the tax correctly for tax-free" do
      expect(tax_free_item.tax).to eq 0
    end

    it "calculates the tax correctly for basic tax" do
      expect(basic_tax_item.tax).to eq 100
    end

    it "calculates the tax correctly for import tax" do
      expect(import_tax_item.tax).to eq 150
    end
  end

  describe "#total_price" do
    it "calculates the total price correctly for tax-free" do
      expect(tax_free_item.total_price).to eq 10.0
    end

    it "calculates the total price correctly for basic tax" do
      expect(basic_tax_item.total_price).to eq 1100.0
    end

    it "calculates the total price correctly for import tax" do
      expect(import_tax_item.total_price).to eq 1150.0
    end
  end
end