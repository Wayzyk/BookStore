class Card < ApplicationRecord
  belongs_to :order

  def card_date
    "#{month}/#{year}"
  end
  
end
