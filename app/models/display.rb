class Display < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre
  belongs_to :status
  belongs_to :load
  belongs_to :area
  belongs_to :day


  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :display_name
    validates :instruction
    validates :image
  end

  with_options presence: true, numericality: { other_than: 1, message: "can't be blank" } do
    validates :genre_id
    validates :status_id 
    validates :load_id 
    validates :area_id 
    validates :day_id
  end

  with_options presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is out of setting range" }, format: { with: /\A[0-9]+\z/, message: "is invalid. Input half-width characters"} do
    validates :price
  end
end