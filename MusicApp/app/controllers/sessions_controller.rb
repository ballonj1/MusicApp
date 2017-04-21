class SessionsController < ApplicationController
  def create
    @user = User.find_by_credentials(params[:user][:email], params[:user][:password])
    if @user
      login!(@user)
      redirect_to user_url(@user)
    else
      flash[:errors] << ["Invalid username/password"]
      render :new
    end
  end

  def new
    @user = User.new
    render :new
  end

  def destroy
    current_user.reset_session_token!
    session[:session_token] = nil
    redirect_to new_sessions_url
  end
end
