class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :create]
  def index
  end

  def new
  #binding.pry
  @item = Item.new
  end

  def create
  end
  
  private

  def authenticate_user!
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end

