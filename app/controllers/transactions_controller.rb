class TransactionsController < ApplicationController
  require "payjp"

  def confirm
    @card = Card.find_by(user_id: current_user.id)
    Payjp.api_key = Rails.application.credentials.PAYJP_SECRET_KEY
    customer = Payjp::Customer.retrieve(@card.customer_id)
    @customer_card = customer.cards.retrieve(@card.card_id)
    @card_brand = @customer_card.brand
    case @card_brand
    when "Visa"
      @card_src = "cards/visa.svg"
    when "MasterCard"
      @card_src = "cards/master-card.svg"
    when "Saison"
      @card_src = "cards/saison-card.svg"
    when "JCB"
      @card_src = "cards/jcb.svg"
    when "American Express"
      @card_src = "cards/american_express.svg"
    when "Diners Club"
      @card_src = "cards/dinersclub.svg"
    when "Discover"
      @card_src = "cards/discover.svg"
    end

    @item=Item.find(params[:id])
  end

  def transacte
    # 購入
  end

end
