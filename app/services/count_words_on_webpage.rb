class CountWordsOnWebpage
 
  attr_accessor :url_str

  def initialize(url_str)
    html = HTMLFromUrl.new(url_str).create()
    @text = TextFromHTML.new(html).create()
  end

  def create
    most_popular_words(10)
  end

  def most_popular_words(top_list_length)
    top = []
    census = word_counts
    top.push(census.pop) until top.length == top_list_length 
    top
  end
  
  def word_counts
    counts = {}
    @text.split(/\s+/).each do |word|
      counts[word] = counts[word] ? counts[word]+= 1 : 1
    end
    counts.sort_by{|k,v|v}
  end

  
end
