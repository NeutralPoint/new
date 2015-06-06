#Контроллер пользователей
class UsersController < ApplicationController
  #Коллбеки для дейтсвий удаления, редактирования
  before_action :signed_in_user, only: [:edit, :update]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy
  #Функция для отображения всех пользователей
  def index
    @users = User.paginate(page: params[:page],:per_page => 10)
  end
  #Функция для создания
  def new
    @user = User.new 
  end
  def edit
    #@user = User.find(params[:id])
  end
  #Функция для удаления
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User punished"
    redirect_to users_url
  end
  #Функция для редактирования
  def update
   #@user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end
  
  def show
    @user = User.find(params[:id])
  end
  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      redirect_to 'gost'
    else
      render 'new'
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :password, :password_confirmation)
    end
    # Before filters

    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Please sign in."
      end
    end
  
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
  
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
