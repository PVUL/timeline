class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      flash[:notice] = 'Sucessfully Added'
      redirect_to tasks_path
    else
      flash[:notice] = @task.errors.full_messages.join('. ')
      render :new
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update_attributes(task_params)
      flash[:notice] = 'Successfully Updated'
      redirect_to project_tasks_path
    else
      flash[:notice] = @task.errors.full_messages.join('. ')
      render :edit
    end
  end

  def destroy
    Task.find(params[:id]).destroy
    flash[:notice] = 'Successfully Deleted'
    redirect_to project_tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:number, :name, :duration, :start, :finish, :predecessors, :resources)
  end

end
