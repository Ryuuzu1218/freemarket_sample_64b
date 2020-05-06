class CardController < ApplicationController
  require "payjp"

  def new
    @card = Card.where(user_id: current_user.id)
    redirect_to card_path(current_user.id) if @card.exists? 
  end

  def create
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
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
    @card = Card.find_by(user_id: current_user.id)
    if @card.blank?
      redirect_to action: "new"
    else
      Payjp.api_key = ENV[PAYJP_PRIVATE_KEY]
      customer = Payjp::Customoer.retrieve(@card.customer_id)
      @customer_card = custmoer.cards.retrieve(@card.card.id)
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

      @exp_month = @customer_card.exp_month
    end
  end

  def destory
    # 登録したクレジットカードの削除
  end

end
