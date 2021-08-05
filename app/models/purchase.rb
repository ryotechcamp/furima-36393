class Purchase < ApplicationRecord
  belongs_to :display
  has_one :address
end
