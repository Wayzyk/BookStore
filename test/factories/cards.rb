FactoryBot.define do
  factory :card do
    registration { nil }
    ip_address { "MyString" }
    first_name { "MyString" }
    last_name { "MyString" }
    card_type { "MyString" }
    card_expires_on { "2018-11-07" }
  end
end
