class ProjectsController < ApplicationController
  respond_to :html, :xml, :json, :csv
  
  def index
    if current_user.professor?
      @search = current_user.projects.search(params[:q])
      @projects = @search.result

      respond_with(@projects)
    else
      @search = ProfessorProject.order(:id).search(params[:q])
      @professor_projects = @search.result
      
      respond_with(@professor_projects)
    end
  end

  def show
    @project = current_user.projects.find(params[:id])
  end

  def new
    @project = current_user.projects.new
  end
  
  def create
    @project = current_user.projects.new(params[:project])
    
    if @project.save
      redirect_to projects_path, notice: I18n.t('projects.create.successful')
    else
      render :new
    end
  end

  def edit
    @project = current_user.projects.find(params[:id])
  end
  
  def update
    @project = current_user.projects.find(params[:id])
    
    if @project.update_attributes params[:project]
      redirect_to projects_path, notice: I18n.t('projects.update.successful')
    else
      render :edit
    end
  end
  
  def destroy
    @project = current_user.projects.find(params[:id])
    @project.destroy
  end
  
  def subscribe
    @professor_project = ProfessorProject.find_by_project_id(params[:id])
    if current_user.subscribe(@professor_project)
      redirect_to dashboard_path
    else
      redirect_to projects_path, alert: I18n.t('errors.save')
    end
  end  
end
