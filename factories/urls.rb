require 'rails_helper'

FactoryGirl.define do
  factory :url do
    value Faker::Internet.url

    factory :url_with_popularities do
      transient do 
        popularities_count 10
      end
        
      after(:create) do |url,evaluator|
        FactoryGirl.create_list(:popularity, evaluator.popularities_count, url_value: url.value)
      end

    end

  end
end
