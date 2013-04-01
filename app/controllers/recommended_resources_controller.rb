class RecommendedResourcesController < ApplicationController
  respond_to :html, :xml, :json
  
  def index
    @search = current_user.recommended_resources.includes(:resource).search(params[:q])
    @recommended_resources = @search.result.paginate(page: params[:page])
    
    respond_with(@recommended_resources)
  end
  
  def create
    @recommended_resource = current_user.user_recommended_resources.new
    build_recommended_resource(@recommended_resource)
    
    if @recommended_resource.save
      redirect_to resources_path, notice: t('recommended_resources.create.successful')
    else
      redirect_to resources_path, warning: t('recommended_resources.create.unsuccessful')
    end
  end
  
  def build_recommended_resource(recommended_resource)
    recommended_resource.resource = current_user.resources.find(params[:user_recommended_resource][:resource_id])
    recommended_resource.student_id = params[:user_recommended_resource][:student_id] if current_user.professor?
    recommended_resource.professor_id = params[:user_recommended_resource][:professor_id] if current_user.student?
  end
end
