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
      user_offers = CompanyOffer.where(mem_id: current_user)
      @use = user_offers.find_by(com_id: @company.id)
    else
      begin
        @company = Company.find(params[:id])
        if @company.admit == FALSE
          @company.admit = TRUE
          @company.save!
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
end
