module Scrape
  class ExtractTextAndCountWords < Command
   
    attr_accessor :url

    def initialize(url)
      @url = url
    end

    def execute
      top_ten
    end

    def top_ten
      top = []
      census = word_census
      top.push(census.pop) until top.length == 10 
      top
    end
    
    def word_census
      census = {}
      url_to_text().split(/\s+/).each do |word|
        census[word] = census[word] ? census[word]+= 1 : 1
      end
      census.sort_by{|k,v|v}
    end

    def url_to_text
      html = html_from_url
      scrub_html(html)
    end

    def html_from_url
      require 'open-uri'
      require 'rubygems'
      Nokogiri::HTML(open(@url))                                                                                                                                                                                                
    end

    def scrub_html(html)
      html.search('//script').each do |node|
        node.children.remove
        node.content = ''
      end
      
      html.text.gsub(/\W/,' ').gsub(/\s+/, ' ').sub(/\A\s+|\s+\Z/,'')
    end
    
  end
end
