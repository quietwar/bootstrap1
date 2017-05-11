class UsersController < ApplicationController


  def index
    @users = User.all
     layout :choose_layout
  end


  def new
  end

  protected

   def choose_layout
    if current_user.admin?
     “admin”
    elseif current_user.user?
     “user”
    else
     “application”
    end
  end
end
