class ChatPagesController < ApplicationController
  skip_before_action :login_required
  skip_before_action :login_com_required
  skip_before_action :login_super_user_required
  def index
    @chat_pages = ChatPage.all
  end

  def show
    @chat_page = ChatPage.find(params[:id])
    @chat_states = @chat_page.chat_states.all
    @chat_join_mems = @chat_page.chat_join_mems.all
    @chat_state = ChatState.new
    @report = Report.new

    if current_company
      @report_man = current_company.id
    elsif current_user
      @report_man = current_user.id
    end

    session[:chat_page_id] = @chat_page.id
  end

  def new
    @chat_page = ChatPage.new
  end

  def create

    @chat_page = ChatPage.new(chat_page_params)

    if @chat_page.start_date.nil?
      redirect_to new_chat_page_path, notice: "入力された項目に誤りがあります" and return
    end
    puts 1213241

    if @chat_page.max_mem.nil?
      redirect_to new_chat_page_path, notice: "入力された項目に誤りがあります" and return
    end 
    puts 121241
    
    if @chat_page.theme.empty?
      redirect_to new_chat_page_path, notice: "入力された項目に誤りがあります" and return
    end 


    @chat_join_mem =  @chat_page.chat_join_mems.new
    if current_user
      @chat_page.designer_id = current_user.id
      @chat_page.designer_name = current_user.user_name
      @chat_page.designer_val = "user"
      @chat_join_mem.mem_id = current_user.id
      @chat_join_mem.mem_name = current_user.user_name
    elsif current_company
      @chat_page.designer_id = current_company.id
      @chat_page.designer_name = current_company.com_name
      @chat_page.designer_val = "com"
      @chat_join_mem.mem_id = current_company.id
      @chat_join_mem.mem_name = current_company.com_name
    end
    @chat_page.join_mem += 1

    if @chat_page.max_mem >= 2
      @chat_page.rec = true
    else
      @chat_page.rec = false
    end

    @chat_page.period = Date.today

    if !@chat_page.password.empty?
      @chat_page.readable = false
    end

    @chat_page.update = Date.today

    unless @chat_page.finish_date.nil?
      if @chat_page.start_date > @chat_page.finish_date
          redirect_to new_chat_page_path, notice: "入力された項目に誤りがあります" and return
      end
    end
 

    if @chat_page.save
      redirect_to chat_page_path(@chat_page), notice: "チャットを作成しました。"
    else
      redirect_to new_chat_page_path, notice: "入力された項目に誤りがあります"
    end
  end

  def remark

  end

  private
  def chat_page_params
    params.require(:chat_page).permit(:max_mem, :start_date, :finish_date, :password, :readable, :theme)
  end

end
