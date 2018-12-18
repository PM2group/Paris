class ChatStatesController < ApplicationController
  skip_before_action :login_required
  skip_before_action :login_com_required
  skip_before_action :login_super_user_required
  def create
    @chat_page = ChatPage.find(session[:chat_page_id])
    @chat_join_mem =  @chat_page.chat_join_mems.new
    @chat_state = @chat_page.chat_states.new(chat_state_params)
    
    if @chat_page.start_date > Date.today || (!@chat_page.finish_date.nil? && @chat_page.finish_date < Date.today)
      redirect_to chat_page_path(@chat_page), notice: "書き込み可能期間ではありません" and return
    end

    if current_company && @chat_page.designer_val == "user"
      redirect_to chat_page_path(@chat_page), notice: "企業は学生が作成したチャットページには発言できません" and return
    end

    if current_user
      @user = current_user
      @chat_state.mem_id = @user.id
      @chat_state.mem_name = @user.user_name
      @chat_state.mem_val = "user"
    elsif current_company
      @com = current_company
      @chat_state.mem_id = @com.id
      @chat_state.mem_name = @com.com_name
      @chat_state.mem_val = "com"
    end
    @chat_state.remark_date = Date.today
    @chat_join_mems = @chat_page.chat_join_mems.all
    @chat_page.update_date = Date.today

    if @chat_state.save
      redirect_to chat_page_path(@chat_page), notice: "送信しました"
    else
      redirect_to chat_page_path(@chat_page), notice: "グループメッセージが送信できませんでした"
    end
  end

  private
  def chat_state_params
    params.require(:chat_state).permit(:sentence)
  end
end
