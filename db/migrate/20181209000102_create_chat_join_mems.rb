class CreateChatJoinMems < ActiveRecord::Migration[5.2]
  def change
    create_table :chat_join_mems do |t|
       t.integer :mem_id, null:false
       t.string :mem_name, null: false
    end
  end
end
