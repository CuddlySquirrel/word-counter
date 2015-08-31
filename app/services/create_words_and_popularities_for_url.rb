class CreateWordsAndPopularitiesForUrl

  attr_accessor :url

  def initialize(url_obj)
    @url = url_obj
  end

  def create
    counted_words.each do |word_str,occurrences|
      word_obj = Word.find_or_create_by( value: word_str )
      Popularity.create(url_id: @url.id, word_id: word_obj.id, occurrences: occurrences )
    end
  end
  
  
  private

  def counted_words
    url_str = @url.value
    html = HTMLFromUrl.new(url_str).create
    text = TextFromHTML.new(html).create
    MostPopularWordsInText.new(text).create
  end

end
