class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :postage
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :shipping_day

  with_options presence: true do
    validates :image
    validates :name
    validates :detail
    # validates :category
    # validates :status
    # validates :postage
    # validates :prefecture
    # validates :shipping_day
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :postage_id
    validates :prefecture_id
    validates :shipping_day_id
  end

  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, with: /\A[0-9]+\z/}


end
