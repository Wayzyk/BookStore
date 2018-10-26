FactoryBot.define do

  factory :book do
    name { Faker::Book.title }
    price { Faker::Number.decimal(2) }
    description { Faker::Food.description }
    year_of_publish { Faker::Stripe.year }
  end

  factory :author do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
  end
end
