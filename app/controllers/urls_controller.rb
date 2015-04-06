class UrlsController < ApplicationController
  def index
    @list = Url.all.to_a.sort_by{|k|k['value'].downcase}
  end
  
  def new
    @errors = {}
  end

  def create
    url = Url.new :value => params[:value]
    if url.valid?
      url.save!
      redirect_to urls_path
    else
      @errors = url.errors.messages
      render new_url_path
    end
  end

  def show
    @url = Url.find params['id']
  end

end
