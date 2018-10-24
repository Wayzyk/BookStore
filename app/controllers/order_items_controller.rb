class OrderItemsController < ApplicationController
  def create
    @order = current_order
    @item = @order.order_items.build(items_params)
    @order.save!
    session[:order_id] = @order.id
    redirect_to cart_path
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
