class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :postage
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :shipping_day

  validates :name, :detail, :category, :status, :postage, :prefecture, :shipping_day, :price, presence: true
  validates :category_id, :status_id, :postage_id, :prefecture_id, :shipping_day_id, numericality: { other_than: 1 }

  # 画像必須(ActiveStorage)
  # price 範囲設定 ¥300~¥9,999,999
  # price 半角数字のみ
end
