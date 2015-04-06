class UrlsController < ApplicationController
  def index
    @list = Url.all.to_a.sort_by.sort_by{|k|k['name'].downcase}
  end
  
  def new
  end

  def create
    Url.create :value => params[:value]
    redirect_to urls_path
  end

  def show
    @url = Url.find params['id']
  end

end
