# coding: utf-8
class SessionsController < ApplicationController

  skip_before_action :login_required
  skip_before_action :login_com_required
  def new
  end

  def create
    reset_session
    user = User.find_by(mem_info: session_params[:mem_info])

    if user&.authenticate(session_params[:password])
      session[:user_id] = user.id
      redirect_to user_pages_path, notice: 'ログインしました'
    else
      render :new
    end
  end


  def destroy
    reset_session
    redirect_to root_path, notice: 'ログアウトしました'
  end

  private

  def session_params
    params.require(:session).permit(:mem_info, :password)
  end
  
end
