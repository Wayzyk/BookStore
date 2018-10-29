FactoryBot.define do

  factory :book do
    name { Faker::Book.title }
    price { Faker::Number.decimal(2) }
    description { Faker::Food.description }
    year_of_publish { Faker::Date.between(100.year.ago, Date.today) }
    materials { Faker::Commerce.material }
    height { Faker::Number.decimal(2) }
    width { Faker::Number.decimal(2) }
    length { Faker::Number.decimal(2) }
  end

  factory :author do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
  end
end
