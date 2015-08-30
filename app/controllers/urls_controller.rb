class UrlsController < ApplicationController
  def index
    @urls = Url.order(:value)
  end
  
  def new
    @errors = {}
  end

  def create
    value = params[:value] 

    url = Url.find_by_value value
    if url
      redirect_to url_path url.id
      return
    end
    
    url = Url.new value: value
    if url.save
      CreateWordsAndPopularitiesForUrl.new(url).create()
      redirect_to url_path url.id
    else
      @errors = url.errors.messages
      render new_url_path
    end

  end

  def show
    @url = Url.find params['id']
  end

end
