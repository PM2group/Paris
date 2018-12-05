class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :mem_name
      t.string :user_name
      t.string :mem_info, null: false
      t.date :mem_birth
      t.date :mem_gra
      t.string :des_occupation
      t.string :des_location
      t.string :password_digest
      t.string :pic
      t.string :univercity
      t.string :circle
      t.string :labo
      t.string :study
      t.string :deliver
      t.string :activity
      t.string :qualification
      t.string :lang_experience
      t.string :system_ex
      t.string :flame_ex

      t.timestamps
    end
  end
end
