class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :postage_payer
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :hadling_time

  validates :category, :condition, :postage_payer, :prefecture, :handling_time, presence: true

  validates :category, :condition, :postage_payer, :prefecture, :handling_time, numericality: { other_than: 1 }
end
