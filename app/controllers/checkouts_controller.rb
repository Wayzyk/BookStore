class CheckoutsController < ApplicationController
  include Wicked::Wizard

  steps :checkout_address, :checkout_delivery, :checkout_payment, :checkout_confirm, :checkout_complete

  def show
    @user = current_user
    @order = current_order
    case step
    when :checkout_address
      @billing_address
      @shipping_address
    when :checkout_delivery
      current_order
    when :checkout_payment
      @card = current_order.cards
    end
    render_wizard
  end

  def update
    @user = current_user
    @order = current_order
    # @user.attributes = params[:user]
    render_wizard
  end

  private

  def redirect_to_finish_wizard
    redirect_to category_books_path(:category_id), notice: "You order was accepted."
  end
end
