class CouponsController < ApplicationController
  def validate
    @coupon = Coupon.find_by(code: params[:code])
    if @coupon.present? && @coupon.is_valid?
      current_order.update(coupon: @coupon)
      response = { valid: true,
                   discounted_price: current_order.total, coupon_amount: @coupon.amount }
    else
      response = { valid: false, discounted_price: current_order.total }
    end
    respond_to do |format|
      format.json { render json: response }
    end
  end
end
