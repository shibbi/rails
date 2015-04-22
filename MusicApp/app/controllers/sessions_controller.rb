class SessionsController < ApplicationController
  before_action :redirect_if_logged_in, only: [:create, :new]
  before_action :redirect_if_not_logged_in, only: [:destroy]

  def new
    render :new
  end

  def create
    @user = User.find_by_credentials(user_params)
    if @user
      login_user!(@user)
      flash[:notice] = "Welcome back, #{@user.email}!"
      redirect_to user_url(@user)
    else
      flash.now[:errors] ||= []
      flash.now[:errors] << 'Incorrect username/password!'
      render :new
    end
  end

  def destroy
    logout
    redirect_to new_session_path
  end

  private

  def user_params
    params.require(:session).permit(:email, :password)
  end
end
