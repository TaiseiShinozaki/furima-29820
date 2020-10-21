class OrderAddress
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :town, :building_name, :phone_number, :user_id, :item_id, :token

  PHONE_NUMBER_REGEX = /\A\d{10,11}\z/
  with_options presence: true do
    validates :post_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'Input correctly' }
    validates :city
    validates :town
    validates :phone_number, format: { with: PHONE_NUMBER_REGEX, message: 'Input only number' }
  end

  with_options presence: true do
    validates :prefecture_id, numericality: { other_than: 1 }
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    #住所の情報を保存 #左側がカラムの値
    Address.create(order_id: order.id, post_code: post_code, prefecture_id: prefecture_id, city: city, town: town, building_name: building_name, phone_number: phone_number)
  end
end