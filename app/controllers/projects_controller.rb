class ProjectsController < ApplicationController
  before_filter :allowed_users
  
  def index
    @projects = current_user.projects.all
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
      flash[:notice] = I18n.t('.success')
      redirect_to projects_path
    else
      render :new
    end
  end

  def edit
    @project = current_user.projects.find(params[:id])
  end
  
  def update
    @project = current_user.projects.find(params[:id])
  end
  
  private
  def allowed_users
    if current_user.role.name != Role::PROFESSOR
      flash[:error] = i18n.t('permissions.lack')
      redirect_to dashboard_path
    end
  end
end
