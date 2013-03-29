class ResourcesController < ApplicationController
  respond_to :html, :xml, :json
  
  def index
    @search = current_user.resources.includes(:authors).search(params[:q])
    @resources = @search.result
    
    respond_with(@resources)
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
      redirect_to resources_path, notice: I18n.t('resources.create.successful')
    else
      render :new
    end
  end
  
  def edit
    @resource = current_user.resources.find(params[:id])
    @resource.authors.build if @resource.authors.empty?
    @resource.quotations.build if @resource.quotations.empty?
    @resource.notes.build if @resource.notes.empty?
  end
  
  def update
    @resource = current_user.resources.find(params[:id])

    if @resource.update_attributes(params[:resource])
      redirect_to resources_path, notice: I18n.t('resources.update.successful')
    else
      render :edit
    end
  end
  
  def destroy
    @resource = current_user.resources.find(params[:id])
    @resource.destroy
    
    redirect_to resources_path
  end
end
