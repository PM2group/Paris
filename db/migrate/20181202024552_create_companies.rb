class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
<<<<<<< HEAD
      t.string :com_name,limit: 50,null: false
      t.string :occupations,limit: 100,null: false
      t.string :location,limit: 50,null: false
      t.string :com_info, null: false,limit: 30
      t.string :condition,null: false,limit: 100
      t.integer :salary, null: false
=======
      t.string :com_name
      t.string :occupations
      t.string :location
      t.string :com_info, null: false
      t.string :condition
      t.integer :salary
>>>>>>> doraemon/master
      t.string :password_digest
      t.string :frame
      t.string :lang
      t.string :adoption
      t.text :appeal
      t.string :system

      t.timestamps
    end
  end
end
