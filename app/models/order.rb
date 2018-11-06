class Order < ApplicationRecord
  has_many :order_items
  belongs_to :coupon
  before_save :update_total

  def calculate_total
    self.order_items.collect { |item| item.book.price * item.quantity }.sum
  end

  private

  def update_total
    if coupon.present?
      self.total = calculate_total - coupon.amount
    else
      self.total = calculate_total
    end
  end
end
