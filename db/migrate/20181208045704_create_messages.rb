class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.integer :send_id
      t.integer :reception_id
      t.text :mess, :limit => 500
      t.date :send_date

      t.timestamps
    end
  end
end
