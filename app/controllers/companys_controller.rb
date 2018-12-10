# coding: utf-8

# coding: utf-8
class CompanysController < ApplicationController
  skip_before_action :login_required
  skip_before_action :login_com_required
  def new
    @company = Company.new
  end

  def create
    company = Company.new(company_params)

    if company.save
      company.company_id = company.id + 2000000000
      company.save
      redirect_to companys_path, notice:"登録完了"
    else
      render :new
    end
  end

  
  def edit
    @company = current_company
  end

  def update
    company = current_company
    company.update!(company_params)
    redirect_to com_pages_path, notice:"更新完了"
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
