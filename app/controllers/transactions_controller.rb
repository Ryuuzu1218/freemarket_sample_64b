class TransactionsController < ApplicationController
  def buy
    Payjp.api_key = "PAYJP_SECRET_KEY"
    Payjp::Charge.create(
      amount: 800
      card: params['payjp-token'],
      currency: 'jpy'
    )
  end

  def transaciton_end
  end

end
