class MessagesController < ApplicationController
  skip_before_action :login_required
  skip_before_action :login_com_required
  skip_before_action :login_super_user_required
  def index
    if current_user
      @user = current_user
    else
      @user = current_company
    end
    @messages = Message.where(reception_id: @user.id).order('created_at desc')
    @messages2 = Message.where(send_id: @user.id).order('created_at desc')
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
        messages = Message.new(:send_id => current_user.id, :reception_id => params[:id], :mess => params[:mess], :send_date => Date.today.to_time)
        if messages.save
          redirect_to user_pages_path, notice: "メッセージを送信しました"
        end
      elsif current_company
        messages = Message.new(:send_id => current_company.id, :reception_id => params[:id], :mess => params[:mess], :send_date => Date.today.to_time)
        if messages.save
          redirect_to com_pages_path, notice: "メッセージを送信しました"
        end
      end
    end

  def edit
  end
end
