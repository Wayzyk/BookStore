class OrderItemsController < ApplicationController
  def create
    @order = current_order
    @item = @order.order_items.build(items_params)
    @order.save!
    flash[:success] = 'Book add to your order.'
    session[:order_id] = @order.id
  end

  def destroy
    @order = current_order
    @item = @order.order_items.find(params[:id])
    @item.destroy
    @order.save
    redirect_to cart_path
  end

  private

  def items_params
    params.require(:order_item).permit(:quantity, :book_id)
  end
end
