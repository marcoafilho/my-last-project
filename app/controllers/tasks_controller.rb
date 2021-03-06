class TasksController < ApplicationController
  respond_to :html, :xml, :json
  
  def index
    @tasks = current_user.tasks
    respond_with(@tasks)
  end

  def show
    @task = current_user.tasks.find(params[:id])
    respond_with(@task)
  end

  def new
    if current_user.student?
      @task = current_user.tasks.new
    elsif current_user.professor?
      @task = Task.new
    end
    
    respond_with(@task)
  end
  
  def create
    if current_user.student?
      @task = current_user.tasks.new(params[:task])
    elsif current_user.professor?
      @task = Task.new(params[:task])
    end    
    
    if @task.save
      respond_with(@task, status: :created, location: @task) do |format|
        if current_user.student?
          format.html { redirect_to(tasks_path, notice: I18n.t('tasks.create.successful')) }
        elsif current_user.professor?
          format.html { redirect_to(students_path, notice: I18n.t('tasks.create.successful')) }
        end
      end
    else
      respond_with(@task.errors, status: :unprocessable_entity) do |format|
        format.html { render :new }
      end
    end
  end

  def edit
    @task = current_user.tasks.find(params[:id])
    respond_with(@task)
  end
  
  def update
    @task = current_user.tasks.find(params[:id])
    
    if @task.update_attributes(params[:task])
      respond_with(@task, status: :created, location: @task) do |format|
        format.html{ redirect_to tasks_path, notice: I18n.t('tasks.update.successful') }
      end
    else
      respond_with(@task.errors, status: :unprocessable_entity) do |format|
        format.html{ render :edit }
      end
    end    
  end
  
  def destroy
    @task = current_user.tasks.find(params[:id])
    @task.destroy
    
    respond_with(@task, status: :removed, location: @task) do |format|
      format.html { redirect_to tasks_path, notice: I18n.t('tasks.destroy.successful') }
    end
  end
end
