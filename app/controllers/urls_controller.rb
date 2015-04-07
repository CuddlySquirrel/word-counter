class UrlsController < ApplicationController
  def index
    @list = Url.all.to_a.sort_by{|k|k['value'].downcase}
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
    if url.valid?
      url.save
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
