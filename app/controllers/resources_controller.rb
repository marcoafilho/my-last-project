class ResourcesController < ApplicationController
  def index
    @resources = current_user.resources.order(:title)
  end
  
  def new
    @resource = current_user.resources.new(type: params[:resource_type])
    @resource.authors.build
    @resource.quotations.build
    @resource.notes.build
  end
  
  def create
    @resource = current_user.resources.new(params[:resource])
    
    if @resource.save
      redirect_to projects_path, notice: I18n.t('resources.create.successful')
    else
      render :new
    end
  end
  
  def edit
    @resource = current_user.resources.find(params[:id])
    @resource.authors.build if @resource.authors.empty?
  end
  
  def update
    @resource = current_user.resources.find(params[:id])
    
    if @resource.update_attributes(params[:resource])
      redirect_to projects_path, notice: I18n.t('resources.update.successful')
    else
      render :edit
    end
  end
  
  def destroy
    @resource = current_user.resources.find(paams[:id])
    @resource.destroy
  end
end
