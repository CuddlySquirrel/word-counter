module UrlHelper

  def helper_most_popular_word(url)
    most_popular = url.popularities.order(:occurrences).last
    { value: most_popular.word.value, occurrences: most_popular.occurrences }
  end
  
  def helper_top_ten_words(url)
    popularities = url.popularities.order(occurrences: :desc)
    popularities.map{|x|{value: x.word.value, occurrences: x.occurrences}}
  end

end
