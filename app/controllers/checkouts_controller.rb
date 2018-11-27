class CheckoutsController < ApplicationController
  include Wicked::Wizard

  steps :checkout_address, :checkout_delivery, :checkout_payment, :checkout_confirm, :checkout_complete

  def show
    @user = current_user
    @order = current_order
    @order_items = current_order.order_items
    case step
    when :checkout_address
      new_address = Address.new(order_id: current_order.id, type: 'BillingAddress')
      current_order.billing_address ||= new_address
      @billing_address = current_order.billing_address
      @billing_address ||= new_address
      new_address = Address.new(order_id: current_order.id, type: 'ShippingAddress')
      current_order.shipping_address ||= new_address
      @shipping_address = current_order.shipping_address
      shipping_address ||= new_address
    when :checkout_delivery
      @deliveries = Delivery.all
    when :checkout_payment
      return jump_to(previous_step) unless current_order.delivery
      @credit_card = CreditCard.new
    when :checkout_confirm
      return jump_to(previous_step) unless current_order.credit_card_id
      @billing_address = current_order.billing_address
      @shipping_address = current_order.shipping_address
      @credit_card = CreditCard.find(current_order.credit_card_id)
    when :checkout_complete
      @billing_address = current_user.billing_address
      @shipping_address = current_user.shipping_address
      return jump_to(previous_step) unless flash[:notice] = "Order accepted"
    end
    render_wizard
  end

  def update
    case step
    when :checkout_address
      current_order.billing_address.update_attributes(billing_address_params)
      current_order.shipping_address.update_attributes(shipping_address_params)
      redirect_to next_wizard_path
    when :checkout_delivery
      current_order.update_attributes(delivery_id: delivery_params[:delivery_id])
      redirect_to next_wizard_path
    when :checkout_payment
      @credit_card = CreditCard.new(credit_card_params.merge(order_id: current_order.id))
      if @credit_card.save
        current_order.update_attributes(credit_card_id: @credit_card.id)
        redirect_to next_wizard_path
      else
        render_wizard # redirect_to previous_step
      end
    when :checkout_confirm
      flash[:notice] = "Confirm order"
      redirect_to next_wizard_path
    end
  end

  private

  def address_params
    return { user_id: current_user.id, order_id: current_order.id }
  end

  def delivery_params
    params.permit(:delivery_id)
  end

  def credit_card_params
    params.require(:credit_card).permit(:credit_card_number,:card_name, :month, :year, :cvv )
  end

  def billing_address_params
    params.require(:order).require(:billing_address).permit(:type, :first_name, :last_name, :address,
                                    :city, :zip, :country, :phone)
  end

  def shipping_address_params
    params.require(:order).require(:shipping_address).permit(:type, :first_name, :last_name, :address,
                                     :city, :zip, :country, :phone)
  end

  def redirect_to_finish_wizard
    redirect_to catalog_path, notice: "You order was accepted."
  end
end
