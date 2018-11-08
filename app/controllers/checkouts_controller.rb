class CheckoutsController < ApplicationController
  include Wicked::Wizard

  steps :checkout_address, :checkout_delivery, :checkout_payment, :checkout_confirm, :checkout_complete

  def show
    @order = current_order
    render_wizard
  end

  def update
    @order = current_order
    # @user.attributes = params[:user]
    render_wizard @order
  end

  private

  def redirect_to_finish_wizard
    redirect_to category_books_path(:category_id), notice: "You order was accepted."
  end
end
