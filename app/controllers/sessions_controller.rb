#Сессионный контроллер
class SessionsController < ApplicationController

  def new
  end
  #Функции для входа
  def create
    user = User.find_by(name: params[:session][:name].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in user
      #redirect_to user
      #flash[:success] = "Welcome "+user.name+"!"
      redirect_back_or gost
    else
      flash.now[:error] = 'Invalid email/password combination'
      render 'new'
    end
  end
  #Для удаления
  def destroy
    sign_out
    redirect_to root_url
  end
end