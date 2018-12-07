class SearchController < ApplicationController
  skip_before_action :login_required
  skip_before_action :login_com_required
  def member


  end

  def company

  end

  def chat

  end
end
