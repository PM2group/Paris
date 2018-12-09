class AddChatPageIdToChatState < ActiveRecord::Migration[5.2]
  def up
    execute 'DELETE FROM chat_states'
    add_reference :chat_states, :chat_page, null: false, index: true
  end

  def down
    remove_reference :chat_states, :chat_page, index: true
  end
end
