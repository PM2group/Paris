# coding: utf-8
class UserPagesController < ApplicationController
  skip_before_action :login_required
  skip_before_action :login_com_required
  skip_before_action :login_super_user_required
  def index
    @chat_pages = ChatPage.all
    if current_user
      if params[:id].to_i == current_user.id || params[:id] == nil
        @user = current_user
        @company_offers = CompanyOffer.where(mem_id: current_user)
        
        @company_offers.each do |company_offer|
          @companys = Company.where(id: company_offer.com_id)
        end
      else
        begin
          @user = User.find(params[:id])
        rescue
          redirect_back(fallback_location: root_path)
        end
      end
    elsif current_company
      @user = User.find(params[:id])
      company_offers = CompanyOffer.where(mem_id: @user.id)
      @com = company_offers.find_by(com_id: current_company)
    else
      begin
        @user = User.find(params[:id])
        if @user.admit == FALSE
          @user.admit = TRUE
          @user.save!
        end 
      rescue
        redirect_back(fallback_location: root_path)
      end
   end
    
  end

  def show
  end

  def new
  end

  def edit
  end
  
  def update
    company_offer = CompanyOffer.find(params[:id])
    company_offer.acc_flag = TRUE
    company_offer.save
    InquiryMailer.send_mail(Company.where("id = ?",company_offer.com_id)).deliver_now
    redirect_to user_pages_path, notice: "更新"
  end

  def create

  end

   
end
