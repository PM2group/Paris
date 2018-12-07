class ChatStatesController < ApplicationController
  def create
    @chat_page = ChatPage.find(session[:chat_page_id])
    @chat_state = @chat_page.chat_states.new(chat_state_params)
    @chat_state.mem_id = current_user.id
    @chat_state.mem_name = current_user.user_name
    @chat_state.remark_date = Date.today
    @chat_states = @chat_page.chat_states.all

    @new_mem = true
    @chat_states.each do |chat_state|
      if current_user.user_name == chat_state.mem_name
        @new_mem = false
      end
    end
    
    if @new_mem
      if @chat_page.join_mem < @chat_page.max_mem
        @chat_page.join_mem += 1
        @chat_page.save
      else
        redirect_to chat_page_path(@chat_page), notice: "上限人数です"
      end
    end

  

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
