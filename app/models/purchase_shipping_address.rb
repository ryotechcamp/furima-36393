class PurchaseShippingAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :area_id, :city, :house_number, :house_name, :telephone_number, :user_id, :display_id

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :area_id, numericality: {other_than: 1, message: "can't be blank"}
    validates :city
    validates :house_number
    validates :telephone_number, format: {with: /\A[0-9]{10, 11}\z/, message: 'is invalid'}
    validates :user_id
    validates :display_id
  end

  def save
    purchase = Purchase.create(user_id: user_id, display_id: display_id)
    Shipping_address.create(postal_code: postal_code, area_id: area_id, city: city, house_number: house_number, house_name: house_name, telephone_number: telephone_number, purchase_id: purchase_id)
  end
end