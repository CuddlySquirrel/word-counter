class Url < ActiveRecord::Base
  validates :value, presence: true, url: true
end
