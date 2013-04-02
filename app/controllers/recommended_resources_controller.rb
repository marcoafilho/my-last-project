class RecommendedResourcesController < ApplicationController
  respond_to :html, :xml, :json
  
  def index
    @search = current_user.recommended_resources.includes(:authors).search(params[:q])
    @recommended_resources = @search.result.paginate(page: params[:page])
    
    respond_with(@recommended_resources)
  end
  
  def show
    @resource = current_user.recommended_resources.find(params[:id])
    
    respond_with(@resource)
  end
  
  def audit
    @audits = (current_user.recommended_resources.find(params[:id]).audits.reorder('version DESC') +
      current_user.recommended_resources.find(params[:id]).associated_audits.reorder('version DESC'))
      .sort_by(&:created_at).reverse
    
    respond_with(@audits)
  end
  
  def create
    @recommended_resource = UserRecommendedResource.new
    build_recommended_resource(@recommended_resource)
    
    if @recommended_resource.save
      redirect_to resources_path, notice: t('recommended_resources.create.successful')
    else
      redirect_to resources_path, warning: t('recommended_resources.create.unsuccessful')
    end
  end
  
  def edit
    @recommended_resource = current_user.recommended_resources.find(params[:id])
    @recommended_resource.authors.build if @recommended_resource.authors.empty?
    @recommended_resource.quotations.build if @recommended_resource.quotations.empty?
    @recommended_resource.notes.build if @recommended_resource.notes.empty?
    
    respond_with(@recommended_resource)
  end
  
  def update
    @recommended_resource = current_user.recommended_resources.find(params[:id])

    if @recommended_resource.update_attributes(params[:resource])
      redirect_to recommended_resources_path, notice: I18n.t('resources.update.successful')
    else
      render :edit
    end
  end
  
  def build_recommended_resource(recommended_resource)
    recommended_resource.resource = current_user.resources.find(params[:user_recommended_resource][:resource_id])
    recommended_resource.recommender_id = current_user.id
    recommended_resource.recommended_id = params[:user_recommended_resource][:recommended_id] if current_user.professor?
    recommended_resource.recommended_id = params[:user_recommended_resource][:recommended_id] if current_user.student?
  end
end
