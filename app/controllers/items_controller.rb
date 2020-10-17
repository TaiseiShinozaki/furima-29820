class ItemsController < ApplicationController
  before_action :move_to_root_path, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user, only: [:edit, :update, :destroy]

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
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  def destroy
    if current_user.id == @item.user.id
      @item.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  private
  
  def move_to_root_path
    redirect_to root_path if user_signed_in? == false
  end

  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :condition_id, :postage_payer_id, :prefecture_id, :handling_time_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def authenticate_user
    if Item.find(params[:id]).user.id != current_user.id
      redirect_to root_path
    end
  end

end

