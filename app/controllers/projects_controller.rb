class ProjectsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_project, except: [:index, :new, :create]

  def index
    @projects = current_user.projects
    @friends = current_user.friends
    set_chatroom
    @message = Message.new
    @messages = current_room.messages.reverse
    @followers = Friendship.where(friend_id: current_user.id)
  end

  def show
    @chatroom = @project.chatrooms.build
    @chatrooms = @project.chatrooms
  end

  def new
    @project = current_user.projects.new
  end

  def create
    @project = current_user.projects
                .find_by(app_name: params[:project][:start_date])

    if @project
      @project.update(project_params)
      flash[:notice] = 'project has been updated'
      redirect_to [current_user, @project]
    else
      @project = current_user.projects.new(project_params)

      if @project.save
        flash[:notice] = 'project has been created'
        redirect_to [current_user, @project]
      else
        flash[:alert] = 'project has not been created'
        render :new
      end
    end

  end

  def edit
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

  def set_chatroom
    if params[:roomId]
      @chatroom = Chatoom.find_by(id: params[:roomId])
    else
       @chatroom = current_user.room
     end
    session[:current_room] = @chatroom.id if @chatroom
  end

  def project_params
    params.require(:project).permit(:app_name, :coding,
                                       :start_date, :user_id)
  end
end
