class OrdersController < ApplicationController
  before_action :set_item
  before_action :authenticate_user
  before_action :authenticate_buyer
  before_action :sold_item
  
  def index
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_address_params)
    #binding.pry
    if @order_address.valid?
      pay_item
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
  
  def order_address_params
    params.require(:order_address).permit(:post_code, :prefecture_id, :city, :town, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: params[:token],
      currency: 'jpy'
    )
  end

  def authenticate_user
    redirect_to new_user_session_path if user_signed_in? == false  
  end
  
  def authenticate_buyer
    @item = Item.find(params[:item_id])
    if @item.user_id == current_user.id
      redirect_to root_path
    end
  end

  def sold_item
    if @item.order.present?
      redirect_to root_path
    end
  end
end
