# frozen_string_literal: true

require_relative "grocery_store/parser"
require_relative "grocery_store/order"
require_relative "grocery_store/receipt"

# Receives input from STDIN or can be piped from file
input_lines = ARGF.read.split("\n")

order = GroceryStore::Parser.parse(input_lines)
GroceryStore::Receipt.new(order).print
