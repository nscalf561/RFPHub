class UsersController < ApplicationController

  def new
    if current_user != nil
      flash[:notice] = "Already logged in"
      redirect_to root_path
    end
    @user = User.new
  end

  def show
    @user = User.find_by_id(params[:id])
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to '/'
    else
      redirect_to '/signup'
    end
  end

private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
