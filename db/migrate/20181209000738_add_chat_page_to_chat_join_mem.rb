class AddChatPageToChatJoinMem < ActiveRecord::Migration[5.2]
  def up
    execute 'DELETE FROM chat_join_mems'
    add_reference :chat_join_mems, :chat_page, null: false, index: true
  end

  def down
    remove_reference :chat_join_mems, :chat_page, index: true
  end

end
