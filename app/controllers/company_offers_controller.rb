# coding: utf-8
class CompanyOffersController < ApplicationController
  skip_before_action :login_required
  skip_before_action :login_com_required
  skip_before_action :login_super_user_required


  def index
  end

  
  def new
    @company_offer = CompanyOffer.new
  end

  def create
    if current_company.balance != 0
      company = Company.find(current_company.id)
      company_offer = CompanyOffer.new
      company_offer.message = params[:message]
      company_offer.com_id = current_company.id
      company_offer.mem_id = params[:id]
      company_offer.acc_flag = FALSE
      company_offer.reaction = TRUE
      company_offer.save!
      company.balance -= 1
      company.save!
      redirect_to com_pages_path

    elsif current_company.balance == 0
      redirect_to company_offers_path
    end
  end

  def show
  end

  def edit
    company = Company.find(params[:id])
    company.balance += 10
    company.save!
    redirect_to super_users_path, notice:"「#{company.com_name}」にオファーを追加しました"
  end
    
  def destroy
    company_offer = CompanyOffer.find(params[:id])
    company_offer.reaction = FALSE
    company_offer.acc_flag = TRUE
    company_offer.save!
    redirect_to user_pages_path
  end

  
end
