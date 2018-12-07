class CreateChatStates < ActiveRecord::Migration[5.2]
  def change
    create_table :chat_states do |t|
      t.date :remark_date, null: false
      t.integer :mem_id, null: false
      t.string :mem_name, null: false
      t.text :sentence, null: false, limit: 500
      t.timestamps
    end
  end
end
