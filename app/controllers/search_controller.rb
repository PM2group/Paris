class SearchController < ApplicationController
  skip_before_action :login_required
  skip_before_action :login_com_required
  def member
    @member = User.all
    @des_occ = params[:des_occ]
  end

  def s_member
    @member = User.find_by(:category => "yuusei")
  end

  def company
    @company
  end

  def chat
    @chat = User.all
  end
end
