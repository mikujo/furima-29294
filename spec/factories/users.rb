FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    first_name            {鈴木}
    last_name             {一郎}
    first_name_leading    {スズキ}
    last_name_leading     {イチロウ}