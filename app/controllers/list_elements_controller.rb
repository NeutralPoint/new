class ListElementsController < ApplicationController
before_action :signed_in_user, only: [:create]
  def create
    @list_element = current_user.list_elements.build(literature_params)
    if @list_element.save
      flash[:success] = "Added!"
      redirect_to root_url
    else
      render '/gost'
    end
  end
  
  private
    def literature_params
      params.require(:list_element).permit(:literature)
    end
end
