class Order < ApplicationRecord
  has_many :order_items
  enum :payment_status, { created: 0, "payment started": 1, "payment error": 2, paid: 3 }
end
