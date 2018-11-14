class CheckoutsController < ApplicationController
  include Wicked::Wizard

  steps :checkout_address, :checkout_delivery, :checkout_payment, :checkout_confirm, :checkout_complete

  def show
    case step
    when :checkout_address
      Address.first || Address.new(user_id: current_user.id, type: 'BillingAddress').save(validate: false)
      @address = Address.first
      current_user.billing_address || Addres.new(user_id: current_user.id, type: 'BillingAddress').save(validate: false)
      @billing_address = current_user.billing_address
      current_user.shipping_address || Address.new(user_id: current_user.id, type: 'ShippingAddress').save(validate: false)
      @shipping_address = current_user.shipping_address
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
    case step
    when :checkout_address
      @billing_address = current_user.billing_address
      @billing_address.update_attributes(billing_address_params)
      @shipping_address = current_user.shipping_address
      @shipping_address.update_attributes(shipping_address_params)
      redirect_to next_wizard_path({ order: @current_user.order })
    when :checkout_delivery
      @order.update_attributes(order_params)
    when :checkout_payment
      @credit_card.update_attributes(order_params)
    when :checkout_confirm
      @billing_address
      @shipping_address
      @order
      @credit_card
    when :checkout_complete
      @billing_address
      @shipping_address
    else
      redirect_to root_path
    end
  end

  private

  def billing_address_params
    params.require(:address).permit(billing_address_attributes: [:type, :first_name, :last_name, :address,
                                    :city, :zip, :country, :phone])
  end

  def shipping_address_params
    params.require(:address).permit(shipping_address_attributes: [:type, :first_name, :last_name, :address,
                                     :city, :zip, :country, :phone])
  end

  def redirect_to_finish_wizard
    redirect_to category_books_path(:category_id), notice: "You order was accepted."
  end
end
