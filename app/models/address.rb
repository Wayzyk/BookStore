class Address < ApplicationRecord
  belongs_to :user

  # scope :billing_addresses, -> { where(type: 'Billing Address') }
  # scope :shipping_addresses, -> { where(type: 'Shipping Address') }

end
