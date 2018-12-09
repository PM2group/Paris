class ChatStatesController < ApplicationController
  def create
    @chat_page = ChatPage.find(session[:chat_page_id])
    @chat_join_mem =  @chat_page.chat_join_mems.new
    @chat_state = @chat_page.chat_states.new(chat_state_params)
    
    if @current_user != nil
      @user = @current_user
      @chat_state.mem_id = @user.id
      @chat_state.mem_name = @user.user_name
      @chat_join_mem.mem_id = @user.id
      @chat_join_mem.mem_name = @user.user_name
    elsif @current_company != nil
      @com = @current_company
      @chat_state.mem_id = @com.id
      @chat_state.mem_name = @com.com_name
      @chat_join_mem.mem_id = @com.id
      @chat_join_mem.mem_name = @com.com_name
    end
    @chat_state.remark_date = Date.today
    @chat_join_mems = @chat_page.chat_join_mems.all
    @chat_page.update = Date.today

    @new_mem = true
    @chat_join_mems.each do |chat_join_mem|
      if @user != nil
        if @user.user_name == chat_join_mem.mem_name
          @new_mem = false
        end
      elsif @com != nil
        if @com.com_name == chat_join_mem.mem_name
          @new_mem = false
        end
      end
    end
    
    if @new_mem
      if @chat_page.join_mem < @chat_page.max_mem
        @chat_page.join_mem += 1
        @chat_page.save
      else
        redirect_to chat_page_path(@chat_page), notice: "上限人数です" and return
      end
    end

  

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
