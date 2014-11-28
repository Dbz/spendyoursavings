class Api::UsersController < ApplicationController
  def create
    @user = User.new(user_params)
    if(@user.save)
      redirect_to root_url
    else
      flash.now[:error] = @user.errors.full_messages
    end
  end
  
  def show
    @user = User.find(params[:id])
    render json: @user, include: [:image] if @user
  end
  
  private
  def user_params
    params.require(:user).permit(:username, :password)
  end
end