class ApplicationController < ActionController::Base

  helper_method :current_order

  def current_order
    if session[:order_id]
      Order.find_by(id: session[:order_id])
    else
      Order.new
    end
  end
end
