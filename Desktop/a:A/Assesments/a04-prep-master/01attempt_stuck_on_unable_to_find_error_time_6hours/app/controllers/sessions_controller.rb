class SessionsController < ApplicationController


  def create
    user = User.find_by_credentials(params[:user][:username],params[:user][:password])
    if user
      login(user)
      redirect_to links_url
    else
      flash.now[:errors] = ["Wrong credentials"]
      render :new
    end
  end


  def destroy
    logout
    redirect_to new_session_url
  end


  def new
    @user = User.new
  end
end
