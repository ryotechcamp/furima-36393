class Display < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre
  belongs_to :status
  belongs_to :load
  belongs_to :area
  belongs_to :day
  

  belongs_to :user
  has_one_attached :image

  validates :display_name, presence: true
  validates :instruction, presence: true
  validates :display_name, presence: true
  validates :genre_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :status_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :load_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :area_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :day_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :price, numericality: { other_than: 1, message: "can't be blank" } 
end
