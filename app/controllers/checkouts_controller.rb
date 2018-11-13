class CheckoutsController < ApplicationController
  include Wicked::Wizard

  steps :checkout_address, :checkout_delivery, :checkout_payment, :checkout_confirm, :checkout_complete

  def show
    case step
    when :checkout_address
      @address = Address.new
    when :checkout_delivery
      @order = current_order.delivery
    when :checkout_payment
      @credit_card = CreditCard.new
    when :checkout_confirm
      current_order
    when :checkout_complete
      current_order
    end
    render_wizard
  end

  def update
    @address.update_attributes(address_params)
    if @address.save
      redirect_to next_wizard_path
    else
      redirect_to wizard_path
    end
    render_wizard @address
  end

  private

  def address_params
    params.require(:address).permit(:type, :first_name, :last_name, :address,
                                    :city, :zip, :country, :phone)
  end

  def redirect_to_finish_wizard
    redirect_to category_books_path(:category_id), notice: "You order was accepted."
  end
end
