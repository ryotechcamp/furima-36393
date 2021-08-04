class Purchase < ApplicationRecord
  belongs_to :display
  has_one :shipping_address
end
