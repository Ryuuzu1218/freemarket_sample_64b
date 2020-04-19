class ItemsController < ApplicationController
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
    params.require(:item).permit(:name, :price, :explanation,:condition_id,:delivery_charge_id,:shipping_origin_id,:sending_days_id,item_images_attributes: [:image,:_destroy, :id]).merge(user_id:current_user.id)
  end
end
