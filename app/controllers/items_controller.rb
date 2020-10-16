class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :create, :show]
  
  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
  @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  @item = Item.find(params[:id])
  end

  private
  
  def authenticate_user!
    unless user_signed_in?
      redirect_to action: :index
    end
  end

  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :condition_id, :postage_payer_id, :prefecture_id, :handling_time_id, :price).merge(user_id: current_user.id)
  end
end

