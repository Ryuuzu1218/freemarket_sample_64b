class CardController < ApplicationController
  require "payjp"
  before_action :set_card

  def new
    card = Card.where(user_id: current_user.id).first
    redirect_to action: "index" if card.present? 
  end

  def create
    # card登録
  end

  def show
    # 登録したクレジットカードの表示
  end

  def destory
    # 登録したクレジットカードの削除
  end

end
