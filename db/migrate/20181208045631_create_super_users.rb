class CreateSuperUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :super_users do |t|
      t.integer :super_user_id
      t.text :super_user_password, :limit => 30
      t.integer :super_user_name

      t.timestamps
    end
  end
end
