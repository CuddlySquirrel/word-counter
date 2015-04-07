module Scrape
  class ExtractTextAndCountWords < Command
   
    attr_accessor :url

    def initialize(url)
      @url = url
    end

    def execute
      [{word:'tt',n:34}, {word:'xx',n:499}]
    end

  end
end
