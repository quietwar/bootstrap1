class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate_user!
  


protected

  def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) << :username
  end

  def resource_not_found
  end

  private

  def chatroom
    @chatroom ||= Chatoom.find(session[:chatroom]) if session[:current_room]
  end

  helper_method :chatroom
end
