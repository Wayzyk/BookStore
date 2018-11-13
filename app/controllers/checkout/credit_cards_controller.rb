class Checkout::CreditCardsController < ApplicationController
  before_action :find_credit_card, only: [:show]
  def new
    @credit_card = CreditCard.new
  end

  def create
    @credit_card.assign_attributes(credit_card_params)
    if @credit_card.save
      redirect_to next_wizard_path
    else
      render_wizard
    end
  end

  private

  def credit_card_params
    params.require(:credit_card).permit()
  end
end
