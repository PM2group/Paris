class TopsController < ApplicationController
  skip_before_action :login_required
  skip_before_action :login_com_required
  skip_before_action :login_super_user_required
  def index

    @company = Company.order("updated_at DESC").limit(3)
    @chat = ChatPage.order("updated_at DESC").limit(3)

  end
end
