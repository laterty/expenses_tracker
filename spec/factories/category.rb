# frozen_string_literal: true

FactoryBot.define do
  factory :category do
    name { FFaker::BaconIpsum.word }
  end
end
