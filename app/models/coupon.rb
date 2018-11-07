class Coupon < ApplicationRecord
  validates_numericality_of :amount, on: :create, message: "is not a number"
  validates_uniqueness_of :code, on: :create, message: "must be unique", case_sensitive: false

  has_many :orders

  def is_valid?
    # (self.expiration.nil? || self.expiration >= Date.curre+nt) &&
    (self.limit != 0 || self.limit > self.used)
  end

  def discounted_price(order)
    if is_valid?
      order.total - amount
    end
  end
end