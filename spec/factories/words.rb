require 'rails_helper'

FactoryGirl.define do
  factory :word do
    value Faker::Lorem.word
  end
end

