class SessionsChatController < ApplicationController
  def create
    @chat_page = ChatPage.find(params[:id])
    session[:chat_page_id] = @chat_page.id

    if @chat_page.password.empty?
        redirect_to chat_page_path(@chat_page)
    else
        if @chat_page.password == params[:password]
            redirect_to chat_page_path(@chat_page)
        else
            redirect_to chat_pages_path
        end
    end
  end

end
