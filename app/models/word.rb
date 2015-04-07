class Word < ActiveRecord::Base
  has_many :popularities
  has_many :urls, :through => :popularities

  validates :value, presence: true, uniqueness: true

end
