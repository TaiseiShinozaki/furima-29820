class OrdersController < ApplicationController
  before_action :set_item
  def index
    @order_address = OrderAddress.new
    # binding.pry
  end

  def create
    @order_address = OrderAddress.new(address_params)
    if @order_address.valid?
      @order_address.save   #バリデーションをクリアした時
      return redirect_to root_path
    else
      render :index   #バリデーションを弾かれた時
    end
  end

  private

  def set_item
    #購入品の情報の取得
    @item = Item.find(params[:item_id])
  end
  
  def address_params
    params.permit(:post_code, :prefecture_id, :city, :town, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end

end
