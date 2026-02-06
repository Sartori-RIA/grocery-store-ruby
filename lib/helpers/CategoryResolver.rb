# frozen_string_literal: true

class CategoryResolver
  CATEGORIES = {
    book: %w[book books novel textbook],
    food: ["chocolate", "chocolates", "bread", "cake", "apple", "hot dog", "hot-dog", "pizza", "meat", "rice", "beans"],
    medical: %w[pill pills headache medicine syrup]
  }.freeze

  def self.resolve(name)
    normalized = name.downcase

    CATEGORIES.each do |category, keywords|
      return category if keywords.any? { |word| normalized.include?(word) }
    end

    :other
  end
end
