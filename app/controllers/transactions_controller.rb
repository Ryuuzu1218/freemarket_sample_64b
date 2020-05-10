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
    @item = Item.find(params[:id])
    # if @item.present?
    #   redirect_to item_path(@item.id)
    # else
    #   @item.with_lock do
    #     if current_user.card.present?
    #       @card = Card.find_by(user_id: current_user.id)
    #       Payjp.api_key = Rails.application.credentials.PAYJP_SECRET_KEY
    #       charge = Payjp::charge.create(
    #         amout: @item.price,
    #         customer: Payjp::Customer.retrive(@card.customer_id),
    #         currency: 'jpy'
    #       )
    #     else
    #       Payjp::Charge.create(
    #         amount: @item.price,
    #         card: params['payjp_token'],
    #         currency: 'jpy'
    #       )
    #     end
    #    end
    # end
  end

end
