# coding: utf-8
class SuperUsersController < ApplicationController
  skip_before_action :login_required
  skip_before_action :login_com_required

  def index
    
    @report = Report.all
    @company = Company.where("admit = TRUE")
    #@report.each 通報崎のurlしてい

    @additions = Company.where(balance: 0)  
    
    
  end

  def show



  end

  def new
    @messages = Message.new
  end

  
  def destroy
    if (params[:id].to_i / 1000000000)==1
      user = User.find(params[:id])
      company_offers = CompanyOffer.where(mem_id: user.id)
      company_offers.each do |offer|
        offer.destroy
      end
      reported_mans = Report.where(reported_man: user.id)
      reported_mans.each do |reported_man|
        reported_man.destroy
      end
      report_mans = Report.where(report_man: user.id)
      report_mans.each do |report_man|
        report_man.destroy
      end
      user.destroy
      redirect_to super_users_url, notice: "アカウントID[#{params[:id]}]を削除しました"
    elsif (params[:id].to_i / 1000000000)==2
      com = Company.find(params[:id])
      company_offers = CompanyOffer.where(com_id: com.id)
      company_offers.each do |offer|
        offer.destroy
      end
      reported_mans = Report.where(reported_man: com.id)
      reported_mans.each do |reported_man|
        reported_man.destroy
      end
      report_mans = Report.where(report_man: com.id)
      report_mans.each do |report_man|
        report_man.destroy
      end
      com.destroy
      redirect_to super_users_url, notice: "アカウントID[#{params[:id]}]を削除しました"
    end
  end

end
