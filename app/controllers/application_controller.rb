class ApplicationController < ActionController::Base
  helper_method :current_user
  helper_method :current_company
  helper_method :current_super_user
  before_action :login_required
  before_action :login_com_required
  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def login_required
    redirect_to login_path unless current_user
  end

  def login_com_required
    redirect_to login_com_path unless current_company
  end
  
  def current_company
    @current_company ||= Company.find_by(id: session[:company_id]) if session[:company_id]
  end

  def current_super_user
    @current_super_user ||= Super_user.find_by(id: session[:company_id]) if session[:company_id]
  end

end
