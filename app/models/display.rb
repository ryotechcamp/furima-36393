class Display < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :display_name, presence: true
  validates :instruction, presence: true
  validates :display_name, presence: true
  validates :genre_id, presence: true
  validates :status_id, presence: true
  validates :load_id, presence: true
  validates :area_id, presence: true
  validates :day_id, presence: true
  validates :price, presence: true
end
