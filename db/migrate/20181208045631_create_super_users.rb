class CreateSuperUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :super_users do |t|
      t.integer :super_user_id
      t.string :password_digest
      t.integer :super_user_name
    end
  end
end