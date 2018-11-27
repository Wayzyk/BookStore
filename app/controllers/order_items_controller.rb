class OrderItemsController < ApplicationController
  def create
    @item = current_order.order_items.find_or_initialize_by(book_id: items_params[:book_id])
    current_order.save!
    session[:order_id] = current_order.id if update_quantity.save
  end
  
  def update 
    @item.update_attributes(items_params)
    @order_items = current_order.order_items
  end 

  def destroy
    @item = current_order.order_items.find(params[:id])
    @item.destroy
    @order.save
    redirect_to cart_path
  end

  private

  def items_params
    params.require(:order_item).permit(:quantity, :book_id)
  end
  
  def update_quantity
    qqty = items_params[:quantity].to_i
    @item.quantity= qqty + @item.quantity.to_i
    @item
  end
end