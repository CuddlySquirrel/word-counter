class Url < ActiveRecord::Base
  has_many :popularities
  has_many :words, :through => :popularities

  validates :value, presence: true, uniqueness: true, url: true

  after_save :after_save

  def most_popular
    top_ten.shift
  end

  def top_ten
    popularities.sort{|a,b|b.occurrences <=> a.occurrences}.to_a
  end

  def after_save
    top_ten = Scrape::ExtractTextAndCountWords.new(self[:value]).execute()
    top_ten.each do |word,occurrences|
      word = Word.find_or_create_by( value: word )
      Popularity.create(url_id: self[:id], word_id: word.id, occurrences: occurrences )
    end
  end

end
