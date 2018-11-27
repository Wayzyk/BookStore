class CreditCard < ApplicationRecord
  belongs_to :order
  validates_presence_of :credit_card_number, :month, :year, :cvv, :card_name
  validates_length_of :cvv, in: 3..4
  validates :cvv, numericality: { only_integer: true }
  validates_format_of :year, with: %r{[1][1-9]}
  validates_format_of :credit_card_number, with: %r{\A\d{16}\z}
  validates_format_of :card_name, with: %r{\A[a-zA-Z\s]{0,49}\z}
  validates :month, numericality: { only_integer: true,
                                    greater_than_or_equal_to: 1,
                                    less_than_or_equal_to: 12
                                  }
end
