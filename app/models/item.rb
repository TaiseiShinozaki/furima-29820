class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :postage_payer
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :handling_time
  has_one_attached :image

  validates :image, presence: true
  validates :name, presence: true
  validates :description, presence: true

  validates :category_id, :condition_id, :postage_payer_id, :prefecture_id, :handling_time_id, presence: true
  validates :category_id, :condition_id, :postage_payer_id, :prefecture_id, :handling_time_id, numericality: { other_than: 1 }

  validates :price, presence: true
  validates :price, :numericality => {:only_integer => true }
  # validates :price, :numericality => {:greater_than_or_equal_to => 300, :message => 'Price Out of setting range'} #validatesを二つに分ける方法もある
  validates :price, :numericality => {:greater_than_or_equal_to => 300, :less_than_or_equal_to => 9_999_999, :message => 'Out of setting range'}
end
