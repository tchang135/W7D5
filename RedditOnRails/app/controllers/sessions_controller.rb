class SessionsController < ApplicationController
  before_action :require_logged_in, only: %i[destroy]
  before_action :require_logged_out, only: %i[new create]

  def new
    @user = User.new
    render :new
  end

  def create
    username = params[:user][:username]
    password = params[:user][:password]
    @user = User.find_by_credentials(username, password)
    if @user
      login(@user)
      redirect_to root #some index page
    else
      flash.now[:errors] = @user.erorrs.full_messages
      render :new
    end
  end

  def destroy
    logout!
    redirect_to new_session_url
  end
end
