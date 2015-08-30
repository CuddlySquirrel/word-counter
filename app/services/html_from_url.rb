require 'open-uri'
require 'nokogiri'

class HTMLFromUrl

  attr_accessor :url_str

  def initialize(url_str)
    @url = url_str
  end

  def create
    html = html_get
    Nokogiri::HTML(html)
  end

  def html_get
    open(@url)
  end
    
end
