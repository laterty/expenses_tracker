# frozen_string_literal: true

FactoryBot.define do
  factory :expense do
    name { FFaker::BaconIpsum.word }
    value { rand(0..100.0) }
    description { FFaker::BaconIpsum.sentence(10) }
    user
    category
    created_at { Time.now }
  end
end
