# Grocery Store - Ruby (No Rails)

This project implements a simple grocery store checkout system using
pure Ruby and Object-Oriented Programming principles.

## Requirements

- Ruby 3.3+ (tested on 3.3 and 3.2)
- Bundler

## Installation

```bash
bundle install
```

## Running the Application

```bash
ruby lib/grocery_store.rb
```

## Running Tests

```bash
bundle exec rspec
```

## Design Principles

- Pure Ruby (no Rails)
- Clear separation of responsibilities
- Single Responsibility Principle
- Thread-safe (no shared mutable global state)
- Minimalistic design (no over-engineering)

## Architecture

- Item – represents a product
- TaxCalculator – handles tax rules
- Order – aggregates items
- Receipt – formats output

## Tax Rules

- 10% basic tax
- Imported items: additional 5%
- Taxes rounded up to nearest 0.05

## Why this design?

The goal was to keep the system simple and readable while maintaining
extensibility. No unnecessary patterns or abstractions were introduced.