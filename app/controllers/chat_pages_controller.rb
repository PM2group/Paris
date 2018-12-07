class ChatPagesController < ApplicationController
  def index
    @chat_pages = ChatPage.all
  end

  def show
    @chat_page = ChatPage.find(params[:id])
    @chat_states = @chat_page.chat_states.all
    @chat_state = ChatState.new
    session[:chat_page_id] = @chat_page.id
  end

  def new
    @chat_page = ChatPage.new
  end

  def create
    @chat_page = ChatPage.new(chat_page_params)
    @chat_page.designer_id = current_user.id
    @chat_page.designer_name = current_user.user_name
    @chat_page.period = Date.today
    /if :password != null
      chat_page.readable = false
    end/
    @chat_page.update = Date.today

    if @chat_page.save
      redirect_to chat_page_path(@chat_page), notice: "チャットを作成しました。"
    else
      render :new
    end
  end

  def remark

  end

  private
  def chat_page_params
    params.require(:chat_page).permit(:max_mem, :start_date, :password, :readable, :theme)
  end

end