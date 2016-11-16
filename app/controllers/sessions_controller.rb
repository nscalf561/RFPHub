class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email(params[:email])
    #If the user exists AND the password entered is correct
    if user && user.authenticate(params[:password])
      # Save the user id inside the browser cookie.
      # TODO: Does this session method work with private browsing?
      session[:user_id] = user.id
      redirect_to '/'
      flash[:notice] = "Successfully logged in."
    else
      # If the user's login fails
      redirect_to '/login'
      flash[:notice] = "Invalid e-mail or password."
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
    flash[:notice] = "Successfully logged out."
  end

end
