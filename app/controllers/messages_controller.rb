class MessagesController < ApplicationController
  skip_before_action :login_required
  skip_before_action :login_com_required
  def index
    if current_user
      @user = current_user
    else
      @user = current_company
    end
    @messages = Message.where(reception_id: @user.id)
  end

  def show
    @messages = Message.find(params[:id])
  end

  def new
    if current_user
      @user = current_user
    else
      @user = current_company
    end
    @messages = Message.new
  end

  def create
    require 'date'
    if current_user
      messages = Message.create(:send_id => current_user.id, :reception_id => params[:id], :mess => params[:mess], :send_date => Date.today.to_time)
      redirect_to user_pages_path
    elsif current_company
      messages = Message.create(:send_id => current_company.id, :reception_id => params[:id], :mess => params[:mess], :send_date => Date.today.to_time)
      redirect_to com_pages_path
    end
  end

  def edit
  end
end
