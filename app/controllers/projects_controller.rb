class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      flash[:notice] = 'Sucessfully Added'
      redirect_to projects_path
    else
      flash[:notice] = @project.errors.full_messages.join('. ')
      render :new
    end
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    if @project.update_attributes(project_params)
      flash[:notice] = 'Successfully Updated'
      redirect_to projects_path
    else
      flash[:notice] = @project.errors.full_messages.join('. ')
      render :edit
    end
  end

  def show
    @project = Project.find(params[:id])
    @tasks = Task.all
  end

  def destroy
    Project.find(params[:id]).destroy
    flash[:notice] = 'Successfully Deleted'
    redirect_to projects_path
  end

  private

  def project_params
    params.require(:project).permit(:name, :duration, :start, :finish)
  end

end
