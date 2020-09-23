FactoryBot.define do
  factory :user_order do
    token {'tok123456789'}
    postal_code {'123-4567'}
    prefecture_id {3}
    city {'新宿'}
    house_number {'3-2'}
    building_name {'Aビル'}
    phone_number {'08012345678'}
    user_id {40}
    item_id {45}
  end
end
