class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_filter  :run_before_filter
  def run_before_filter
    @params = params
    @con = params[:controller]
    @act = params[:action]
  end
end
