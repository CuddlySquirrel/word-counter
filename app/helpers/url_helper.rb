module UrlHelper
  def helper_most_popular_word(url)
    most_popular = url.popularities.order(:occurrences).last
    { value: most_popular.word.value, occurrences: most_popular.occurrences }
  end
end
