class UsersController < ApplicationController
  def create
    @user = User.new(user_params)
    if @user.save
      login!(@user)
      redirect_to user_url(@user)
    else
      flash[:errors] << @user.errors.full_messages
      redirect_to user_url
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    render :show
  end

  def new
    @user = User.new
    render :new
  end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end
end
