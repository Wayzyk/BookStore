class Address < ApplicationRecord
  belongs_to :user

  validates_presence_of :first_name, :last_name, :address, :city, :zip, :country, :phone
  validates_length_of :first_name, :last_name, :address, :city, :country, maximum: 49
  validates :first_name, :last_name, format: { with: /\A[A-Za-z]{0,49}\z/ }
  validates :city, :country, format: { with: /\A[A-Za-z\s]{0,49}\z/ }
  validates :address, format: { with: /\A[-A-Za-z\s\d,]{0,49}\z/ }
  validates_length_of :phone, maximum: 15
  validates_length_of :zip, maximum: 10
  

end
