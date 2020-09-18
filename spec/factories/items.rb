FactoryBot.define do
  factory :item do
    name            { '商品１' }
    detail          { '商品１のdetailです' }
    category_id     { 2 }
    status_id       { 2 }
    postage_id      { 2 }
    prefecture_id   { 2 }
    shipping_day_id { 2 }
    price           { 3000 }
    association :user

    after(:build) do |content|
      content.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
