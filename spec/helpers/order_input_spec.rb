# frozen_string_literal: true

require 'spec_helper'

def mock_gets(*values)
  fake_input = double('input')
  allow(fake_input).to receive(:gets).and_return(
    *values.map { |v| "#{v}\n" }
  )
  fake_input
end

RSpec.describe OrderInput do
  describe '#read_items' do
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
end
