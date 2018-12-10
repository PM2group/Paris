class SessionsChatController < ApplicationController
  skip_before_action :login_required
  skip_before_action :login_com_required
  skip_before_action :login_super_user_required
  def create
    @chat_page = ChatPage.find(params[:id])
      if @chat_page.readable
        redirect_to chat_page_path(@chat_page)
      else
        if @chat_page.password == params[:password]
          redirect_to chat_page_path(@chat_page)
        else
         redirect_to chat_pages_path, notice: "パスワードが正しくありません"
        end
      end
  end
end
