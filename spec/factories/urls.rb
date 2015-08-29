require 'rails_helper'

FactoryGirl.define do
  factory :url do
    value Faker::Internet.url
  end
end
