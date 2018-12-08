class SearchController < ApplicationController
  skip_before_action :login_required
  skip_before_action :login_com_required

  def member

    s_word = params[:s_word]
    e_word = params[:e_word]
    list = ["NOT user_name IS NULL"]

    des_occ = params[:des_occ]
    des_loc = params[:des_loc]
    quali = params[:quali]
    univ = params[:univ]
    lan_exp = params[:lan_exp]
    
    unless s_word.empty? then
      list[0].concat(" AND univercity LIKE %?% ")
      list.push(s_word)
    end

    unless e_word.empty? then
      list[0].concat(" AND univercity NOT LIKE %?% ")
      list.push(e_word)
    end

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

    s_word = params[:s_word]
    e_word = params[:e_word]
    list = ["NOT com_name IS NULL"]

    occ = params[:occ]
    loc = params[:loc]
    system = params[:system]
    salary = params[:salary]
    frame = params[:frame]
    lang = params[:lang]

    unless s_word.empty? then
      list[0].concat(" AND com_name LIKE %?% ")
      list.push(s_word)
    end

    unless e_word.empty? then
      list[0].concat(" AND com_name LIKE %?% ")
      list.push(e_word)
    end

    unless occ.empty? then
      list[0].concat(" AND occupations = ?")
      list.push(occ)
    end

    unless loc.empty? then
      list[0].concat(" AND location = ?")
      list.push(loc)
    end
    
    unless system.empty? then
      list[0].concat(" AND system = ?")
      list.push(system)
    end

    unless salary.empty? then
      list[0].concat(" AND salary = ?")
      list.push(salary)
    end
  
    unless frame.empty? then
      list[0].concat(" AND frame = ?")
      list.push(frame)
    end
    
    unless lang.empty? then
      list[0].concat(" AND lang = ?")
      list.push(lang)
    end

    @compnay = Company.order("updated_at").where(list)

  end

  def chat
    s_word = params[:s_word]
    e_word = params[:e_word]
    list = ["NOT designer_name IS NULL"]

    category = params[:category]
    theme = params[:theme]
    part = params[:part]

    unless s_word.empty? then
      list[0].concat(" AND theme LIKE %?% ")
      list.push(s_word)
    end

    unless e_word.empty? then
      list[0].concat(" AND theme NOT LIKE %?% ")
      list.push(e_word)
    end

    unless category.empty? then
      list[0].concat(" AND desginer_id LIKE ?%")
      list.push(category)
    end

    unless theme.empty? then
      list[0].concat(" AND theme LIKE %?%")
      list.push(theme)
    end
    
    unless part.empty? then
      list[0].concat(" AND join_men < ?")
      list.push(part)
    end

    @chat = ChatPage.order("updated_at").where(list)

  end

end
