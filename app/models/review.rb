class Review < ApplicationRecord
  belongs_to :user
  belongs_to :book

  validates_presence_of :rating, :title, :comment
  validates :rating,
    numericality: {
                    only_integer: true,
                    greater_than_or_equal_to: 1,
                    less_than_or_equal_to: 5
                  }
  validates :comment, format: { with: /\A[a-zA-Z\d\s]+[-!#$%&'*+\/=?^_`{|}~.,]?[a-zA-Z\d\s]*\z/ }
end
