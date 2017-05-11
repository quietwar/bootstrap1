class StartupsController < ApplicationController
  def index
      @aprojects = User.paginate(:page => params[:page])
    end

    def search
      @projects = User.search_by_name(params[:search_name])
        .paginate(:page => params[:page])
    end
  end
 
