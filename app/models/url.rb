class Url < ActiveRecord::Base
  has_many :popularities
  has_many :words, :through => :popularities

  validates :value, presence: true, uniqueness: true, url: true

end
