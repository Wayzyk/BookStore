class ApplicationController < ActionController::Base

  helper_method :current_order
  before_action :categories

  def categories
    @categories = Category.with_counted_books || Category.none
  end

  def current_order
    if session[:order_id]
      Order.find_by(id: session[:order_id])
    else
      # Order.new
      order = Order.find_or_create_by(user_id: current_user.id)
      session[:order_id] = order.id
      order
    end
  end
end
