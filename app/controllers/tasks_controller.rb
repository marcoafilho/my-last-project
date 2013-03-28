class TasksController < ApplicationController
  respond_to :html, :xml, :json
  
  def index
    @tasks = Task.all
    respond_with(@tasks)
  end

  def show
    @task = Task.find(params[:id])
    respond_with(@task)
  end

  def new
    @task = Task.new
    respond_with(@task)
  end
  
  def create
    @task = Task.new(params[:task])
    
    if @task.save
      redirect_to tasks_path, notice: I18n.t('tasks.create.successful')
    else
      render :new
    end
  end

  def edit
    @task = Task.find(params[:id])
    respond_with(@task)
  end
  
  def update
    @task = Task.find(params[:id])
    
    if @task.update_attributes(params[:task])
      redirect_to tasks_path, notice: I18n.t('tasks.update.successful')
    else
      render :edit
    end    
  end
  
  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    respond_with(@task)
  end
end
