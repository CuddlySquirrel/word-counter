require 'rails_helper'

FactoryGirl.define do
  factory :popularity do
    occurrences { Faker::Number.between(1, 100) }
    url
    word
  end
end

