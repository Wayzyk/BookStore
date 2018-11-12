class Delivery < ApplicationRecord
  validates_presence_of :method, :delivery_price, :min_days, :max_days
  validates :delivery_price, numericality: { greater_than_or_equal_to: 0.01 }
  validates_length_of :method, in: 3..100
end
