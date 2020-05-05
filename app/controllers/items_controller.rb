class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :set_parent_category, only: [:new, :create, :edit,]
  
  def index
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
  end

  def edit
    @item = Item.find(params[:id])
    @parent = Category.where(ancestry: nil)
    @images_length = @item.item_images.length
    @grandchildren = Category.where(ancestry: @item.category.ancestry)
    @children = Category.where(ancestry: @item.category.parent.ancestry)
  end

  def update
    @item = Item.find(params[:id])
    @parent = Category.where(ancestry: nil)
    @parent = Category.where(ancestry: nil)
    if @item.user_id == current_user.id
      @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      redirect_to item_path(@item.id)
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

  def set_item
    @item = Item.find(params[:id])
  end

  def set_parent_category
    @parent = Category.where(ancestry: nil)
  end
end