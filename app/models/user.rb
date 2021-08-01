class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true

  with_options presence: true, format: { with: /^[ぁ-んァ-ヶー一-龠]+$/, message: 'first name is invalid. Input full-width characters' } do
    validates :kanji_first_name
  end
  with_options presence: true, format: { with: /^[ぁ-んァ-ヶー一-龠]+$/, message: 'last name is invalid. Input full-width characters' } do
    validates :kanji_last_name
  end
  with_options presence: true, format: { with: /^[ア-ン゛゜ァ-ォャ-ョー「」、]+$/, message: 'first name kana is invalid. Input full-width characters' } do
    validates :kana_first_name
  end
  with_options presence: true, format: { with: /^[ア-ン゛゜ァ-ォャ-ョー「」、]+$/, message: 'last name kana is invalid. Input full-width characters' } do
    validates :kana_last_name
  end
  
  validates :birthday, presence: true

end
