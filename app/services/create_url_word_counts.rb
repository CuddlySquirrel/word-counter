class CreateUrlWordCounts
  attr_accessor :url

  def initialize(url)
    @url = url
  end

  def create
    counted_words_array = counted_words(@url.value)
    counted_words_array.each do |word_str,occurrences|
      word_obj = Word.find_or_create_by( value: word_str )
      Popularity.create(url_id: @url.id, word_id: word_obj.id, occurrences: occurrences )
    end
  end
  
  
  private

  def url_extraction_service
    Scrape::ExtractTextAndCountWords
  end

  def counted_words(url_value)
    url_extraction_service.new(url_value).run()
  end

end
