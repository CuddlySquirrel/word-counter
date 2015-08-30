require 'nokogiri'

class TextFromHTML
  
  attr_accessor :html

  def initialize(html)
    @html = html 
  end

  def create
    html = remove_script_tags(@html)
    html = remove_style_tags(html)
    text = html.text
    text = change_non_words_to_spaces(text)
    text = remove_extra_spaces(text)
  end


  private

  def remove_script_tags(html)
    html.search('//script').each do |node|
      node.children.remove
      node.content = ''
    end
    html
  end

  def remove_style_tags(html)
    html.search('//style').each do |node|
      node.children.remove
      node.content = ''
    end
    html
  end

  def change_non_words_to_spaces(text)
    text.gsub(/\W/,' ')
  end

  def remove_extra_spaces(text)
    text.gsub(/\s+/, ' ').sub(/\A\s+|\s+\Z/,'')
  end
end
