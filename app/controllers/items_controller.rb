class ItemsController < ApplicationController
  def index
    @parents = Category.all.where(ancestry:nil).order("id ASC").limit(13)
    @items = Item.includes(:item_images).order('created_at DESC').limit(6).where.not(transaction_status: 0).where(transaction_status: 1)
  end

  def new
    @parent = Category.where(ancestry: nil)
    @item = Item.new
    @item.item_images.new
  end

  def create
    @parent = Category.where(ancestry: nil)
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

  def category_children
    respond_to do |format|
      format.html
      format.json do
        @category_children = Category.find(params[:parent_id]).children
      end
    end
  end

  def category_grandchildren
    respond_to do |format|
      format.html
      format.json do
        @category_grandchildren = Category.find(params[:child_id]).children
      end
    end
  end


  private

  def item_params
    params.require(:item).permit(:name, :price, :explanation,:condition_id,:delivery_charge_id,:shipping_origin_id,:sending_days_id, :category_id, :brand, item_images_attributes: [:image,:_destroy, :id]).merge(user_id:current_user.id)
  end
end
