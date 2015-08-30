require 'rails_helper'

FactoryGirl.define do
  factory :popularity do
    occurrences Faker::Number.between(1, 100)
    transient do
      url_value Faker::Internet.url
    end
    url do
      puts url_value
      existing = Url.find_by(value: url_value)
      existing.nil? ? FactoryGirl.create(:url, value: url_value) : existing
    end
    word do
      word_value  = Faker::Lorem.word
      existing = Word.find_by(value: word_value)
      existing.nil? ? FactoryGirl.create(:word, value: word_value) : existing
    end
  end
end

