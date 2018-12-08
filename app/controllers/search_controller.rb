class SearchController < ApplicationController
  skip_before_action :login_required
  skip_before_action :login_com_required
  def member



    s_word = params[:s_word]
    e_word = params[:e_word]
    list = ["NOT user_name IS NULL"]
    
    des_occ = params[:des_occ]
    des_loc = params[:des_loc]
    quali = params[:puali]
    univ = params[:univ]
    lan_exp = params[:lan_exp]

    unless des_occ.empty? then
      list[0].concat(" AND des_occupation = ?")
      list.push(des_occ)
    end

    unless des_loc.empty? then
      list[0].concat(" AND des_location = ?")
      list.push(des_loc)
    end
    
    unless quali.empty? then
      list[0].concat(" AND qualification = ?")
      list.push(quali)
    end

    unless univ.empty? then
      list[0].concat(" AND univercity = ?")
      list.push(univ)
    end
    
    unless lan_exp.empty? then
      list[0].concat(" AND lang_ex = ?")
      list.push(lan_exp)
    end

    @member = User.order("updated_at").where(list)

  end

  def company
    @company
    @s_word = params[:s_word]
    @e_word = params[:e_word]
  end

  def chat
    @chat = User.all
  end
end
