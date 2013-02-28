class ProjectsController < ApplicationController
  before_filter :allow_user
  
  def index
    if current_user.professor?
      @projects = current_user.projects.all
    else
      @professor_projects = ProfessorProject.order(:id)
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
    @project = Project.find(params[:id])
    if current_user.subscribe(@project)
      redirect_to dashboard_path
    else
      redirect_to projects_path, alert: I18n.t('errors.save')
    end
  end  
end
