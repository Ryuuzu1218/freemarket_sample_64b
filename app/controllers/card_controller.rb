class CardController < ApplicationController
  require "payjp"
  before_action :set_card, only:[:new, :show, :destroy]

  def new
    if @card
      redirect_to action: :show, id: @card.id
    end
  end

  def create
    Payjp.api_key = Rails.application.credentials.PAYJP_SECRET_KEY
    if params["payjp_token"].blank?
      redirect_to action: :new
    else
      customer = Payjp::Customer.create(
        email: current_user.email,
        card: params["payjp_token"]
      )
      @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to action: :show, id: @card.id
      else
        redirect_to action: :new
      end
    end
  end

  def show
    if @card.blank?
      redirect_to action: :new
    else
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
    end
  end

  def destroy
    if @card.destroy
      redirect_to new_card_path
    else
      redirect_to card_path(@card.id)
    end
  end

  private

  def set_card
    @card = Card.find_by(user_id: current_user.id)
  end
end