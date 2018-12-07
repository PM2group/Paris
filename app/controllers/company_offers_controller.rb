class CompanyOffersController < ApplicationController
  skip_before_action :login_required
  skip_before_action :login_com_required

  
  def new
    @company_offer = CompanyOffer.new
  end

  def create
    company_offer = CompanyOffer.new
    company_offer.message = params[:message]
    company_offer.com_id = current_company.id
    company_offer.mem_id = params[:id]
    company_offer.acc_flag = FALSE
    company_offer.save!
    redirect_to com_pages_path
  end

  def show
    if current_user
      company_offer = CompanyOffer.find(params[:id])
      @company = Company.find(company_offer.com_id)
    elsif current_company
      company_offer = CompanyOffer.find(params[:id])
      @user = User.find(company_offer.mem_id)
    end
  end
                            
  def destroy
    company_offer = CompanyOffer.find(params[:id])
    company_offer.destroy
    redirect_to user_pages_path
  end

end
