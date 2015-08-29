class Url < ActiveRecord::Base
  has_many :popularities
  has_many :words, :through => :popularities

  validates :value, presence: true, uniqueness: true, url: true

  after_save :associate_words_and_popularities

  def most_popular
    top_ten_words.shift
  end

  def top_ten_words
    popularities.sort{|a,b|b.occurrences <=> a.occurrences}.to_a
  end


  private

  def counted_words
    Scrape::ExtractTextAndCountWords.new(self[:value]).run()
  end

  def associate_words_and_popularities
    counted_words().each do |word,occurrences|
      word = Word.find_or_create_by( value: word )
      Popularity.create(url_id: self[:id], word_id: word.id, occurrences: occurrences )
    end
  end

end
