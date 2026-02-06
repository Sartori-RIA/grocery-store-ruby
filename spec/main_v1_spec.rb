# frozen_string_literal: true

require_relative '../lib/main_v1'

def mock_gets(*values)
  fake_input = double('input')
  allow(fake_input).to receive(:gets).and_return(
    *values.map { |v| "#{v}\n" }
  )
  fake_input
end

RSpec.describe 'MainV1' do
  describe '#add_items' do
    it 'return the list of items' do
      item_1 = '1 fried potato at 10'
      item_2 = '3 burguer at 10'

      input = mock_gets(item_1, 'y',
                        item_2, 'n')

      items = send(:add_items, input: input)

      expect(items.size).to eq(2)
      expect(items.first).to eq(item_1)
      expect(items.last).to eq(item_2)
    end
  end

  describe '#categorize' do
    it 'returns the category other' do
      item = '1 AMAZING PS5 at 1000'
      mock_gets(item, 'n')
      expect(send(:categorize, item)).to eq(:other)
    end

    it 'returns the category food' do
      item = '1 large pizza at 5'
      mock_gets(item, 'n')
      expect(send(:categorize, item)).to eq(:food)
    end

    it 'returns the category book' do
      item = '1 book at 5'
      mock_gets(item, 'n')
      expect(send(:categorize, item)).to eq(:book)
    end

    it 'returns the category medical' do
      item = '1 pills for headache at 5'
      mock_gets(item, 'n')
      expect(send(:categorize, item)).to eq(:medical)
    end
  end

  describe '#format_order_items' do
    let(:items) do
      [
        '1 cake at 20',
        '2 chocolate at 15.90',
        '3 imported PS5 at 1000'
      ]
    end
    subject { send(:format_order_items, items) }

    it {
      expect(subject[0]).to eq({ quantity: 1, price: 20, name: '1 cake', is_imported: false,
                                 category: :food })
    }
    it {
      expect(subject[1]).to eq({ quantity: 2, price: 15.90, name: '2 chocolate', is_imported: false,
                                 category: :food })
    }
    it {
      expect(subject[2]).to eq({ quantity: 3, price: 1000, name: '3 imported PS5', is_imported: true,
                                 category: :other })
    }
  end

  describe '#sum_order_values' do
    it 'when is food taxes must be zero and must sum the total' do
      items = []
      CATEGORIES[:food].each do |allowed_food|
        items << "1 #{allowed_food} at 10"
      end
      items_formatted = format_order_items(items)
      taxes, total = send(:sum_order_values, items_formatted)
      expect(taxes).to eq(0)
      expect(total).to eq(CATEGORIES[:food].size * 10)
    end

    it 'when is book taxes must be zero and must sum the total' do
      items = []
      CATEGORIES[:book].each do |allowed_food|
        items << "1 #{allowed_food} at 10"
      end
      items_formatted = format_order_items(items)
      taxes, total = send(:sum_order_values, items_formatted)
      expect(taxes).to eq(0)
      expect(total).to eq(CATEGORIES[:book].size * 10)
    end

    it 'when is medical taxes must be zero and must sum the total' do
      items = []
      CATEGORIES[:medical].each do |allowed_food|
        items << "1 #{allowed_food} at 10"
      end
      items_formatted = format_order_items(items)
      taxes, total = send(:sum_order_values, items_formatted)
      expect(taxes).to eq(0)
      expect(total).to eq(CATEGORIES[:medical].size * 10)
    end

    it 'when is other taxes must be 10%' do
      items = ['1 amazing PS5 at 1000']
      items_formatted = format_order_items(items)
      taxes, total = send(:sum_order_values, items_formatted)
      expect(taxes).to eq(100)
      expect(total).to eq(1100)
    end

    it 'when is other and imported taxes must be 10% + 5%' do
      items = ['1 imported amazing PS5 at 1000']
      items_formatted = format_order_items(items)
      taxes, total = send(:sum_order_values, items_formatted)
      expect(taxes).to eq(150)
      expect(total).to eq(1150)
    end
  end

  describe '#print_order' do
    it 'prints the order summary' do
      items = [
        { name: '1 book', price: 10 },
        { name: '1 chocolate', price: 5 }
      ]

      taxes = 1.5
      total = 16.5

      expect do
        send(:print_order, items, taxes, total)
      end.to output(
        "====*====*====*====*====*====*====*====*====*\n\n" \
          "1 book: 10\n" \
          "1 chocolate: 5\n\n" \
          "Sale Taxes: 1.5\n" \
          "Total: 16.5\n\n" \
          "====*====*====*====*====*====*====*====*====*\n\n" \
          "Thanks for buying with us, have a nice day XD\n" \
          "====*====*====*====*====*====*====*====*====*\n\n"
      ).to_stdout
    end
  end

  describe '#welcome' do
    it 'returns the welcome message' do
      expect { send(:welcome) }
        .to output("Welcome to Subscribe Grocery Story :D\n")
        .to_stdout
    end
  end
end
