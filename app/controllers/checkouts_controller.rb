class CheckoutsController < ApplicationController
  include Wicked::Wizard

  steps :checkout_address, :checkout_delivery, :checkout_payment, :checkout_confirm, :checkout_complete

  def show
    case step
    when :checkout_address
      @addresses = Address.new(address_params)
    when :checkout_delivery
      @deliveries = Delivery.all
    when :checkout_payment
      return jump_to(previous_step) unless current_order.delivery
      @credit_card = CreditCard.new
    when :checkout_confirm
      return jump_to(previous_step) unless current_order.credit_card_id
      @addresses = AddressesForm.new(address_params)
    when :checkout_complete
      return jump_to(previous_step) unless flash[:notice] = "Order accepted"
    end
    render_wizard
  end

  def update
    case step
    when :checkout_address
      @addresses = Address.new(address_params)
      redirect_to next_wizard_path
    when :checkout_delivery
      current_order.update_attributes(order_params)
      redirect_to next_wizard_path
    when :checkout_payment
      @credit_card = CreditCard.new(credit_card_params)
      render_wizard unless @credit_card.save
      redirect_to next_wizard_path
    when :checkout_confirm
      flash[:notice] = "Confirm order"
      redirect_to next_wizard_path
    end
  end

  private

  def address_params
    return { user_id: current_user.id, order_id: current_order.id }
  end

  def order_params
    params.require(:order).permit(:delivery_id)
  end

  def credit_card_params
    params.require(:credit_card).permit(:credit_card_number,:card_name, :month, :year, :cvv )
  end
  # def show
  #   case step
  #   when :checkout_address
  #     Address.first || Address.new(user_id: current_user.id, type: 'BillingAddress').save(validate: false)
  #     @address = Address.first
  #     current_user.billing_address || Addres.new(user_id: current_user.id, type: 'BillingAddress').save(validate: false)
  #     @billing_address = current_user.billing_address && current_order.billing_address
  #     current_user.shipping_address || Address.new(user_id: current_user.id, type: 'ShippingAddress').save(validate: false)
  #     @shipping_address = current_user.shipping_address && current_order.shipping_address
  #   when :checkout_delivery
  #     @order = current_order.delivery
  #   when :checkout_payment
  #     @credit_card = CreditCard.new
  #   when :checkout_confirm
  #     current_order
  #   when :checkout_complete
  #     current_order
  #   end
  #   render_wizard
  # end
  #
  # def update
  #   case step
  #   when :checkout_address
  #     @billing_address = current_user.billing_address && current_order.billing_address
  #     @billing_address.update_attributes(billing_address_params)
  #     @shipping_address = current_user.shipping_address && current_order.shipping_address
  #     @shipping_address.update_attributes(shipping_address_params)
  #     redirect_to next_wizard_path({ order: @current_user.order })
  #   when :checkout_delivery
  #     @order.update_attributes(order_params)
  #   when :checkout_payment
  #     @credit_card.update_attributes(order_params)
  #   when :checkout_confirm
  #     @billing_address
  #     @shipping_address
  #     @order
  #     @credit_card
  #   when :checkout_complete
  #     @billing_address
  #     @shipping_address
  #   else
  #     redirect_to root_path
  #   end
  # end
  #
  # private
  #
  # def billing_address_params
  #   params.require(:order).permit(billing_address_attributes: [:type, :first_name, :last_name, :address,
  #                                   :city, :zip, :country, :phone])
  # end
  #
  # def shipping_address_params
  #   params.require(:order).permit(shipping_address_attributes: [:type, :first_name, :last_name, :address,
  #                                    :city, :zip, :country, :phone])
  # end

  def redirect_to_finish_wizard
    redirect_to catalog_path, notice: "You order was accepted."
  end
end
