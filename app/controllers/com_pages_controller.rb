class ComPagesController < ApplicationController
  skip_before_action :login_required
  def index
    @company = current_company
    @company_offers = CompanyOffer.where(com_id: current_company)
  end

  def show
  end

  def new
  end

  def edit
  end
end
