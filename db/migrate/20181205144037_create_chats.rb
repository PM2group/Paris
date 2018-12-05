class CreateChats < ActiveRecord::Migration[5.2]
  def change
    create_table :chats do |t|
      t.integer :designer_id, null: false
      t.string :designer_name, limit:50, null:false
      t.date :period
      t.integer :max_mem, null:false
      t.integer :join_mem, default:0
      t.boolean :rec, null:false, default:true
      t.date :start_date
      t.date :finish_date
      t.string :thme, limit:200, null:false
      t.boolean :readable, default:true
      t.string :password, limit:30
      t.string :page_url
      t.date :update, null:false

      t.timestamps
    end
  end
end
