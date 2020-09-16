class Item < ApplicationRecord
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :postage
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :shipping_day

  validates :name, :detail, :category, :status, :postage, :prefecture, :shipping_day, :price, :user, presence: true
  validates :category, :status, :postage, :prefecture, :shipping_day, numericality: { other_than: 1 }
end
