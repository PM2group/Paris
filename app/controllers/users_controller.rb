# coding: utf-8

# coding: utf-8
class UsersController < ApplicationController
  skip_before_action :login_required
  skip_before_action :login_com_required
  skip_before_action :login_super_user_required
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      @user.id = @user.id + 1000000000
      @user.admit = FALSE
      @user.save
      begin
        InquiryMailer.send_mail(@user).deliver_now
        redirect_to users_path, notice:"メールが送信されました。内容を確認してください"
      rescue
        redirect_to new_user_path, notice:"メールが送れませんでした"
      end
    else
      render :new
    end
  end
  
  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to user_pages_path, notice: "更新完了"
    else
      render :edit
    end
  end
  
  def show
  end

  def index
  end
  
  private
  def user_params
    params.require(:user).permit(:mem_id, :mem_name, :user_name, :mem_info, :mem_birth, :mem_gra, :des_occupation, :des_location, :password, :password_confirmation, :pic, :univercity, :circle, :labo, :study, :deliver, :activity, :qualification, :lang_ex, :system_ex, :flame_ex)
  end
end
