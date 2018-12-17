class ComPagesController < ApplicationController
  skip_before_action :login_required
  skip_before_action :login_com_required
  skip_before_action :login_super_user_required
  def index
    @chat_pages = ChatPage.all
    if current_company
      if params[:id].to_i == current_company.id || (params[:id] == nil)
        @company = current_company
        @company_offers = CompanyOffer.where(com_id: current_company)
      end
    elsif current_user
      @company = Company.find(params[:id])
      @use = CompanyOffer.find_by(mem_id: current_user)
    else
      @company = Company.find(params[:id])
      if @company.admit == FALSE
      @company.admit = TRUE
      @company.save!
      end
    end
  end

  def show
  end

  def new
  end

  def edit
  end
end
