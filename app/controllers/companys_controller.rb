# coding: utf-8

# coding: utf-8
class CompanysController < ApplicationController
  skip_before_action :login_required
  skip_before_action :login_com_required
  skip_before_action :login_super_user_required
  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)

    if @company.save
      @company.id = @company.id + 2000000000
      @company.save
      begin
        InquiryMailer.send_mail(@company).deliver_now
        redirect_to companys_path, notice:"登録完了"
      rescue
        redirect_to new_company_path, notice:"メールが送れませんでした"
      end
    else
      render :new, notice:"項目に誤りがあります"  
    end
  end

  
  def edit
    @company = current_company
  end

  def update
    @company = current_company
    if @company.update(company_params)
      redirect_to com_pages_path, notice: "更新完了"
    else
      render :edit    
    end
  end

  def show
  end

  def index
    
  end

  private
  def company_params
    params.require(:company).permit(:com_name,:occupations,:location,:com_info,:condition,:salary,:password,:password_confirmation,:frame,:lang,:adoption,:system,:appeal)
  end
  
end
