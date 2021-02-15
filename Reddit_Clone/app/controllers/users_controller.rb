class UsersController < ApplicationController
  before_action :require_logged_in, only:[:destroy]
  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.save && log_in(@user)
      redirect_to users_url
    else
      flash.now[:errors] = ["Invalid username or Password"]
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    if @user 
      render :show
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to users_url
    end
  end

  def index
    @users = User.all
    render :index
  end

  def destroy
    user = User.find(params[:id])
    if current_user == user
        log_out
        user.destroy
    end

    redirect_to users_url
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
