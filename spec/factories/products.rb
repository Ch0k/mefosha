FactoryBot.define do
  factory :product do
    title { "MyString" }
    description { "MyText" }
    price { 1 }
    published { false }

    trait :invalid do
      title { nil }
    end
  end
end
