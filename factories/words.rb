require 'rails_helper'

FactoryGirl.define do
  factory :word do
    value { Faker::Lorem.characters(30) }
  end
end

