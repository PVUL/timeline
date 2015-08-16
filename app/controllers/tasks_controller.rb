class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @project = Project.find_by(id: params[:project_id])
    @task.project = @project

    if @task.save
      flash[:notice] = 'Sucessfully Added'
      redirect_to project_path(@project)
    else
      flash[:notice] = @task.errors.full_messages.join('. ')
      render project_path(@project)
    end
  end

  def edit
    @task = Task.find(params[:id])
    @project = Project.find_by(id: params[:project_id])
  end

  def update
    @task = Task.find(params[:id])
    @project = Project.find_by(id: params[:project_id])
    if @task.update_attributes(task_params)
      flash[:notice] = 'Successfully Updated'
      redirect_to project_path(@project)
    else
      flash[:notice] = @task.errors.full_messages.join('. ')
      render :edit
    end
  end

  def destroy
    @project = Project.find_by(id: params[:project_id])
    Task.find(params[:id]).destroy
    flash[:notice] = 'Successfully Deleted'
    redirect_to project_path(@project)
  end

  private

  def task_params
    params.require(:task).permit(:number, :name, :duration, :start, :finish, :predecessors, :resources)
  end

end
