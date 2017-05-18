module Admins
  class SessionsController < Devise::RegistrationsController
    include ApplicationHelper
  before_action :authenticate_user!


  def new
  end

  private

  #def verify_email
    #(redirect_to(root_path) unless current_user.email.include?("@hiddengeniusproject.org"))
  #end


  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :email,
                                 :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :email,
              :password, :password_confirmation, :current_password)
  end
end
end
