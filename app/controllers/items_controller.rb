class ItemsController < ApplicationController
  before_action :set_item, only:[:show,:edit,:update]
  before_action :authenticate_user!, except: [:index,:show]
  before_action :move_to_index, except: [:index,:show]
  
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
    if  @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end




  private

  def item_params
    params.require(:item).permit(:image,:name,:description,:category_id,:condition_id,:postage_id,:price,:day_to_ship_id,:prefecture_id).merge(user_id: current_user.id)
  end

  def move_to_index
    @item = Item.find(params[:id])
    unless user_signed_in? && current_user.id == @item.user_id
      redirect_to root_path
    end
  end

  def set_item
    @item = Item.find(params[:id])
  end

end
