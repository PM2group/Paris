class TopsController < ApplicationController
  skip_before_action :login_required
  skip_before_action :login_com_required
  def index

    @company = Company.order("updated_at").limit(3)
    @chat = ChatPage.order("updated_at").limit(3)

  end
end
