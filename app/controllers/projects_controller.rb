class ProjectsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_project

  def index
    @projects = current_user.projects    
  end

  def show
    @project = Project.find(params[:id])

  end

  def new
    @project = current_user.projects.new
  end

  def create
    @aproject = Project.new(project_params)
    @project.user = current_user

    if @project.save
        flash[:notice] = 'project has been created'
        redirect_to [current_user, @project]
      else
        flash[:alert] = 'Project has not been created'
        render :new
      end
    end

  def edit
    unless @project.user == current_user
      flash[:alert] = "You can only edit your own project."
      redirect_to root_path
    end
  end

  def update

    if @project.update(project_params)
      flash[:notice] = 'project has been updated'
      redirect_to [current_user, @project]
    else
      flash[:alert] = 'project has not been updated'
      redirect_to [current_user, @project]
    end
  end

  def destroy
    @project.destroy
    flash[:success] = 'project has been deleted'
    redirect_to user_projects_path(current_user)
  end

private
  def set_project
    @project = current_user.projects.find(params[:id])
  end


  def project_params
    params.require(:project).permit(:app_name, :coding,
                                       :start_date, :user_id)
  end
end
