class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  zenkaku_japanese = /\A[ぁ-んァ-ン一-龥]/
  zenkaku_katakana = /\A[ァ-ヶー－]+\z/

  with_options presence: true do
    validates :nickname
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }
    validates :first_name, format: { with: zenkaku_japanese}
    validates :last_name, format: { with: zenkaku_japanese}
    validates :first_name_leading, format: { with: zenkaku_katakana}
    validates :last_name_leading, format: { with: zenkaku_katakana}
    validates :birthday
  end

  has_many :items
  has_many :orders
end
