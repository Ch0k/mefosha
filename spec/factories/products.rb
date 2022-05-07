FactoryBot.define do
  factory :product do
    title { "MyString" }
    description { "MyText" }
    price { 1 }
    published { false }
  end
end
