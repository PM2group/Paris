class SearchController < ApplicationController
  skip_before_action :login_required
  skip_before_action :login_com_required
  def member
<<<<<<< HEAD

=======
    @s_word = params[:s_word]
    @e_word = params[:e_word]
    @des_occ = params[:des_occ]
    @des_loc = params[:des_loc]
    @quali = params[:puali]
    @univ = params[:univ]
    @lan_exp = params[:lan_exp]
    @member = User.where(des_occupation: @des_occ)
>>>>>>> doraemon/master

  end

  def company
<<<<<<< HEAD

  end

  def chat

=======
    @company
    @s_word = params[:s_word]
    @e_word = params[:e_word]
  end

  def chat
    @chat = User.all
>>>>>>> doraemon/master
  end
end
