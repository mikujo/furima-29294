class Shipping < ApplicationRecord
  belongs_to :order

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  with_options presence: true do
    # ハイフン必要
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :city
    validates :house_number
    validates :building_name
    # ハイフン不要11桁以内
    validates :phone_number, format: { with: /\A\d{,11}\z/ }
  end

  validates :prefecture_id numericality: { other_than: 1 }
end
