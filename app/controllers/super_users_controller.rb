class SuperUsersController < ApplicationController
  skip_before_action :login_required
  skip_before_action :login_com_required
  def index
    @report = Report.all

  end

  def show
  end

  def new
    @messages = Message.new
  end

  def delete
  end
end
