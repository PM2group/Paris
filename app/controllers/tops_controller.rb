class TopsController < ApplicationController
  skip_before_action :login_required
  skip_before_action :login_com_required
  def index
  end
end
