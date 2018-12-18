class SearchController < ApplicationController
  skip_before_action :login_required
  skip_before_action :login_com_required
  skip_before_action :login_super_user_required
  def member

    list = ["NOT user_name IS NULL"]
    
    @param = params

    unless params[:s_word].empty? then
      list[0].concat(" AND univercity LIKE ?")
      s_word = "%" + params[:s_word] + "%"
      list.push(s_word)
    end

    unless params[:e_word].empty? then
      list[0].concat(" AND univercity NOT LIKE ?")
      e_word = "%" + params[:e_word] + "%"
      list.push(e_word)
    end

    unless params[:des_occ].empty? then
      list[0].concat(" AND des_occupation = ?")
      des_occ = params[:des_occ]
      list.push(des_occ)
    end

    unless params[:des_loc].empty? then
      list[0].concat(" AND des_location = ?")
      des_loc = params[:des_loc]
      list.push(des_loc)
    end
    
    unless params[:quali].empty? then
      list[0].concat(" AND qualification = ?")
      quali = params[:quali]
      list.push(quali)
    end

    unless params[:univ].empty? then
      list[0].concat(" AND univercity LIKE ?")
      univ = "%" + params[:univ] + "%"
      list.push(univ)
    end
    
    unless params[:lan_exp].empty? then
      list[0].concat(" AND lang_ex LIKE ?")
      lan_exp = "%" + params[:lan_exp] + "%"
      list.push(lan_exp)
    end

    @member = User.order("updated_at").where(list)

  end

  def company

    list = ["NOT com_name IS NULL"]
    
    @param = params

    unless params[:s_word].empty? then
      list[0].concat(" AND concat(com_name,appeal) LIKE ?")
      s_word = "%" + params[:s_word] + "%"
      list.push(s_word)
    end

    unless params[:e_word].empty? then
      list[0].concat(" AND concat(com_name,appeal) NOT LIKE ?")
      e_word = "%" + params[:e_word] + "%"
      list.push(e_word)
    end

    unless params[:occ].empty? then
      list[0].concat(" AND occupations = ?")
      occ = params[:occ]
      list.push(occ)
    end

    unless params[:loc].empty? then
      list[0].concat(" AND location = ?")
      loc = params[:loc]
      list.push(loc)
    end
    
    unless params[:system].empty? then
      list[0].concat(" AND system LIKE ?")
      system = "%" + params[:system] + "%"
      list.push(system)
    end

    unless params[:salary].empty? then
      list[0].concat(" AND salary >= ?")
      salary = params[:salary]
      list.push(salary.to_i)
    end
  
    unless params[:frame].empty? then
      list[0].concat(" AND frame LIKE ?")
      frame = "%" + params[:frame] + "%"
      list.push(frame)
    end
    
    unless params[:lang].empty? then
      list[0].concat(" AND lang LIKE ?")
      lang = "%" + params[:lang] + "%"
      list.push(lang)
    end

    @company = Company.order("updated_at").where(list)

  end

  def chat
    list = ["readable IS true AND NOT designer_name IS NULL"]

    @param = params

    unless  params[:s_word].empty? then
      list[0].concat(" AND concat(designer_name,theme) LIKE ?")
      s_word = "%" + params[:s_word] + "%"
      list.push(s_word)
    end

    unless  params[:e_word].empty? then
      list[0].concat(" AND concat(designer_name,theme) NOT LIKE ?")
      e_word = "%" + params[:e_word] + "%"
      list.push(e_word)
    end

    unless  params[:category].empty? then
      list[0].concat(" AND designer_id  BETWEEN ?000000000 AND ?999999999")
      category = params[:category] +"%"
      list.push(category.to_i)
      list.push(category.to_i)
    end

    unless  params[:theme].empty? then
      list[0].concat(" AND theme LIKE ?")
      theme = "%" + params[:theme] + "%"
      list.push(theme)
    end
    
    unless  params[:part].empty? then
      list[0].concat(" AND join_mem <= ?")
      part = params[:part]
      list.push(part.to_i)
    end

    if params[:sort] == 0
      @chat = ChatPage.where(list)
      @chat = @chat.order("updated_at DESC")
    elsif params[:sort] == 1
      @chat = ChatPage.where(list)
      @chat = @chat.order("join_mem DESC")
    else
      @chat = ChatPage.where(list)
      @chat = @chat.order("max_mem DESC")
    end
  end

end
