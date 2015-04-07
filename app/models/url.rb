class Url < ActiveRecord::Base
  has_many :popularities
  has_many :words, :through => :popularities

  validates :value, presence: true, uniqueness: true, url: true

  after_validation :after_validation

  attr_accessor :value

  private
  def after_validation
    puts ''
    puts '============= after_validation =========='
    puts @value
    g = Scrape::ExtractTextAndCountWords.new(@value).execute()
    puts g
    puts ''
  end

end
