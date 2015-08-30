require 'open-uri'
require 'nokogiri'

class HTMLFromUrl

  attr_accessor :url_str

  def initialize(url_str)
    @url = url_str
  end

  def create
    Nokogiri::HTML(open(@url))                                                                                                                                                                                                
  end
end
