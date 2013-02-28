class Resources::ArticlesController < Resources::ApplicationController
  def new
    @resource = current_user.articles.new
    @resource.authors.build
  end
  
  def create
    @resource = current_user.articles.new params[:article]
    
    if @resource.save
      redirect_to resources_path, notice: I18n.t('resources.create.successful')
    else
      render 'new'
    end
  end
end
