class Order < ApplicationRecord
  has_many :order_items
  belongs_to :delivery, optional: true
  belongs_to :coupon, optional: true
  before_save :update_total

  def calculate_total
    self.order_items.collect { |item| item.book.price * item.quantity }.sum
  end

  private

  def update_total
    if coupon.present?
      self.subtotal = calculate_total
      self.total = calculate_total - coupon.amount
    elsif coupon.present? && delivery.present?
      self.subtotal = calculate_total
      self.total = calculate_total - coupon.amount + delivery.delivery_price
    elsif delivery.present?
      self.subtotal = calculate_total
      self.total = calculate_total + delivery.delivery_price
    else
      self.subtotal = self.total = calculate_total
    end
  end
end
