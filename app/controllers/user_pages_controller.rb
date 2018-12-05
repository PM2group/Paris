class UserPagesController < ApplicationController
  
 skip_before_action :login_com_required
  def index
    @user = current_user
  end

  def show
  end

  def new
  end

  def edit
  end
end
