class Resources::ArticlesController < ApplicationController
  def new
    @resource = current_user.articles.new
  end
  
  def create
    @resource = current_user.articles.new params[:article]
  end
end
