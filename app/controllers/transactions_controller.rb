class TransactionsController < ApplicationController
  def confirm
    # 購入確認
    @item=Item.find(params[:id])
  end

  def transacte
    # 購入
  end

end
