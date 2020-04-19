class ItemsController < ApplicationController
before_action :move_to_index, except: [:index, :show]
  def index
    @parents = Category.all.where(ancestry:nil).order("id ASC").limit(13)
    @items = Item.includes(:item_images).order('created_at DESC').limit(6).where.not(transaction_status: 0).where(transaction_status: 1)
  end

  def new
    @parents = Category.all.where(ancestry:nil).order("id ASC").limit(13)
    @item = Item.new
    @item.item_images.new
  end

  def create
    @item= Item.new(item_params)
    binding.pry
    if @item.save
     redirect_to root_path
    else
     render :new
    end
end


  def show
    @item = Item.find(params[:id])
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end
  private

  def item_params
    params.require(:item).permit(:name, :price, :explanation,:condition,:deliverry_charge,:shipping_origin,:sending_days,item_images_attributes: [:image,:_destroy, :id])
  end

  def move_to_index
    redirect_to new_user_session_path unless user_signed_in?
  end
end
