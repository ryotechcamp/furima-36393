class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'Password is invalid. Include both letters and numbers'

  validates :nickname, presence: true

  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'first name is invalid. Input full-width characters' } do
    validates :kanji_first_name
  end
  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'last name is invalid. Input full-width characters' } do
    validates :kanji_last_name
  end
  with_options presence: true, format: { with: /\A[ァ-ヶ]+\z/, message: 'first name kana is invalid. Input full-width characters' } do
    validates :kana_first_name
  end
  with_options presence: true, format: { with: /\A[ァ-ヶ]+\z/, message: 'last name kana is invalid. Input full-width characters' } do
    validates :kana_last_name
  end
  
  validates :birthday, presence: true

end
