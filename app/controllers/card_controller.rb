class CardController < ApplicationController
  require "payjp"

  def new
    card = Card.where(user_id: current_user.id)
    redirect_to action: "show" if card.exists? 
  end

  def create
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    if params["payjp_token"].blank?
      redirect_to action: "new"
    else
      customer = Payjp::Customer.create(
        email: current_user.email,
        card: params["payjp_token"]
      )
      @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to action: "show"
      else
        redirect_to action: "new"
      end
    end
  end

  def show
    # 登録したクレジットカードの表示
  end

  def destory
    # 登録したクレジットカードの削除
  end

end
