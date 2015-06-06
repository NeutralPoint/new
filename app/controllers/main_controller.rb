class MainController < ApplicationController
  def home
  end
  def all
    if(!signed_in?)
      redirect_to '/signin'
    end
    @all_lists = current_user.feed.paginate(page: params[:page])
  end
  def autors
  end
  
end
