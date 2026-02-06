# frozen_string_literal: true

require_relative '../../lib/helpers/OrderPrinter'
require_relative '../../lib/models/Order'

describe OrderPrinter do
  describe "#self.print" do
    it "render order summary" do
      order = Order.new
      order.add_item("1 book at 10")
      order.add_item("1 imported PS5 at 1000")
      expect {
        described_class.render(order)
      }.to output(
                   "====*====*====*====*====*====*====*====*====*\n\n" \
                     "1 book: 10.0\n" \
                     "1 imported PS5: 1000.0\n\n" \
                     "Sale Taxes: 150.0\n" \
                     "Total: 1160.0\n\n" \
                     "====*====*====*====*====*====*====*====*====*\n\n" \
                     "Thanks for buying with us, have a nice day XD\n" \
                     "====*====*====*====*====*====*====*====*====*\n\n"
                 ).to_stdout
    end
  end
end