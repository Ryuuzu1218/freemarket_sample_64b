class ItemsController < ApplicationController
before_action :move_to_index, except: [:index, :show]
before_action :authenticate_user!, only: [:show]
  def index
    @parents = Category.all.where(ancestry:nil).order("id ASC").limit(13)
    @items = Item.includes(:item_images).order('created_at DESC').limit(3).where.not(transaction_status: 0).where(transaction_status: 1)
    @ladies_items = @items.get_category(1)
    @mens_items   = @items.get_category(2)
    @babies_items = @items.get_category(3)
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

    @item = Item.find(params[:id])
    @parent = Category.where(ancestry: nil)
    @images_length = @item.item_images.length
    binding.pry
  end

  def update
    binding.pry
    @parent = Category.where(ancestry: nil)
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to root_pathn
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
    params.require(:item).permit(:name, :price, :category_id, :brand, :explanation,:condition_id,:delivery_charge_id,:shipping_origin_id,:sending_days_id,item_images_attributes: [:image,:_destroy, :id]).merge(user_id:current_user.id)
  end

  def move_to_index
    redirect_to new_user_session_path unless user_signed_in?
  end
end
