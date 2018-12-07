class ChatStatesController < ApplicationController
  def create
    @chat_page = ChatPage.find(session[:chat_page_id])
    @chat_state = @chat_page.chat_states.new(chat_state_params)
    @chat_state.mem_id = current_user.id
    @chat_state.mem_name = current_user.user_name
    @chat_state.remark_date = Date.today

    if @chat_state.save
        redirect_to chat_page_path(@chat_page), notice: "送信しました"
    else
        render :new
    end
  end

  private
  def chat_state_params
    params.require(:chat_state).permit(:sentence)
  end
end
