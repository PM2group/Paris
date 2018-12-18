# coding: utf-8
class SessionsComController < ApplicationController
  skip_before_action :login_required
  skip_before_action :login_com_required
  skip_before_action :login_super_user_required
  def new
  end

  def create
    reset_session
    company = Company.find_by(com_info: session_params[:com_info])

    if company&.authenticate(session_params[:password])
      if company.admit == TRUE
        session[:company_id] = company.id
        redirect_to com_pages_path, notice: 'ログインしました'
      elsif company.admit == FALSE
        redirect_to ({:action => 'new'}), :notice => 'メールアドレス、パスワードに誤りがあります'
      end
    else
      redirect_to ({:action => 'new'}), :notice => 'メールアドレス、パスワードに誤りがあります'
    end
  end


  def destroy
    reset_session
    redirect_to root_path, notice: 'ログアウトしました'
  end

  private

  def session_params
    params.require(:session_com).permit(:com_info, :password)
  end
  
end
