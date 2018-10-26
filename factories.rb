FactoryBot.define do

  factory :book do
    name { Faker::Book.title }
  end
end
