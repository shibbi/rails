class UsersController < ApplicationController
  before_action :redirect_if_not_logged_in, only: [:show]
  before_action :redirect_if_logged_in, only: [:create, :new]

  def index
    redirect_to new_session_path
  end

  def new
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Welcome to the MusicApp, #{@user.email}!"
      login_user!(@user)
      redirect_to user_path(@user)
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
