# coding: utf-8
class SuperUsersController < ApplicationController
  skip_before_action :login_required
  skip_before_action :login_com_required

  def index
    
    @report = Report.all
    @company = Company.all
    #@report.each 通報崎のurlしてい

    @additions = Company.where(balance: 0)  
    
    
  end

  def show



  end

  def new
    @messages = Message.new
  end

  
  def delete
  end

end
