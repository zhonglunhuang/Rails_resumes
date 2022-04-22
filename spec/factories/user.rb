# frozen_string_literal: true

require 'faker'

FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    username { Faker::JapaneseMedia::SwordArtOnline.real_name }
    password { Faker::Name.name }
    role { 'user' }

    trait :vendor do
      role { 'vendor' }
    end

    trait :admin do
      role { 'admin' }
    end
  end
end
