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
      Order.new
    end
  end
end
