class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
<<<<<<< HEAD
      t.string :mem_name,null: false,limit: 20
      t.string :user_name,null: false,limit: 10
      t.string :mem_info, null: false,unique: true,limit: 30
      t.string :mem_birth,null: false
      t.string :mem_gra,null: false
      t.string :des_occupation,null: false,limit: 100
      t.string :des_location,null: false,limit: 50
      t.string :password_digest,null: false
      t.string :pic
      t.string :univercity,limit: 20
      t.string :circle
      t.string :labo
      t.string :study, limit: 100
      t.string :deliver, limit: 10
      t.string :activity, limit: 50
      t.string :qualification
      t.string :lang_ex
      t.string :system_ex, limit: 50
      t.string :flame_ex, limit: 50
=======
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
>>>>>>> doraemon/master

      t.timestamps
    end
  end
end
