# frozen_string_literal: true

# frozen_string_literal: true

module GroceryStore
  class Parser
    def self.parse(lines)
      order = Order.new

      lines.each do |line|
        next if line.strip.empty?

        count, name, price, imported, exempt = parse_line(line)
        count.times do
          order.add_item(
            Item.new(
              name: name,
              price: price,
              imported: imported,
              exempt: exempt
            )
          )
        end
      end

      order
    end

    # Example: "1 imported box of chocolates at 10.00"
    def self.parse_line(line)
      parts = line.split
      count = parts[0].to_i
      price = parts[-1].to_f

      imported = line.include?("imported")
      exempt = line.match?(/book|chocolate|pill/)

      # name is everything between count and "at"
      name = parts[1..-3].join(" ")

      [count, name, price, imported, exempt]
    end
  end
end
