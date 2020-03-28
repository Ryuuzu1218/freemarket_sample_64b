class ItemsController < ApplicationController
  def index
  end

  def new
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
  end

  def edit
  end

  private

def item_params
  params.require(:item).permit(:name, :price, :explanation,:condition,:deliverry_charge,:shipping_origin,:sending_days,item_images_attributes: [:image])
end
end
