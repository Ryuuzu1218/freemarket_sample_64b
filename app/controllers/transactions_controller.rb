class TransactionsController < ApplicationController
  require "payjp"
  before_action :set_item
  before_action :set_card

  def confirm
    if @card.present?
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

  def transacte
    if @item.tx.present?
      redirect_to item_path(@item.id)
    else
      ActiveRecord::Base.transaction do
        @item.with_lock do
          Payjp.api_key = Rails.application.credentials.PAYJP_SECRET_KEY
          charge = Payjp::Charge.create(
            amount: @item.price,
            customer: Payjp::Customer.retrieve(@card.customer_id),
            currency: 'jpy'
          )
        @transacte = Transaction.create(buyer_id: current_user.id, item_id: params[:item_id], seller_id: @item.user_id)
        @item.update(transaction_status: 0)
        end
      #失敗したときの処理
      rescue => e
        # redirect_to card_path(@card.id)
        redirect_to carderror_item_transaction_path(@card.id)
      end
    end
  end


  private

  def set_item
    @item = Item.find(params[:id])
  end

  def set_card
    @card = Card.find_by(user_id: current_user.id)
  end
end