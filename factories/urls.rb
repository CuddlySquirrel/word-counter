require 'rails_helper'

FactoryGirl.define do
  factory :url do
    value { "#{Faker::Internet.url}/#{Faker::Lorem.characters(13)}" }

    factory :url_with_popularities do
      transient do 
        popularities_count 10
      end
        
      after(:create) do |url,evaluator|
        FactoryGirl.create_list(:popularity, evaluator.popularities_count, url: url)
      end

    end

  end
end

