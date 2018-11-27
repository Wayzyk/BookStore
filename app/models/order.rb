class Order < ApplicationRecord
  has_many :order_items, dependent: :destroy
  belongs_to :delivery, optional: true
  belongs_to :coupon, optional: true
  before_save :update_total

  has_one :billing_address
  has_one :shipping_address

  accepts_nested_attributes_for :billing_address
  accepts_nested_attributes_for :shipping_address

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
