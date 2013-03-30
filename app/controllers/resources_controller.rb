class ResourcesController < ApplicationController
  respond_to :html, :xml, :json
  
  def index
    @search = current_user.resources.includes(:authors).search(params[:q])
    @resources = @search.result.paginate(page: params[:page])
    
    respond_with(@resources)
  end
  
  def show
    @resource = current_user.resources.find(params[:id])
    
    respond_with(@resource)
  end
  
  def new
    @resource = current_user.resources.new(type: params[:resource_type])
    @resource.authors.build
    @resource.quotations.build
    @resource.notes.build
    
    respond_with(@resource)
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
    
    respond_with(@resource)
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
  
  def import
    uploaded_io = params[:xml_file]
    file_name = "#{Time.now.to_i}_#{uploaded_io.original_filename}"
    
    File.open(Rails.root.join('public', 'imports', file_name), 'w') do |file|
      file.write(uploaded_io.read)
    end
    
    @xml = XmlImport.new(file_name: file_name)
    if @xml.import(current_user)
      @xml.destroy
      redirect_to resources_path, notice: I18n.t('resources.import.successful')
    else
      @xml.destroy
      redirect_to resources_path, warning: I18n.t('resources.import.unsuccessful')
    end
  end
end
