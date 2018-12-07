class CreateCompanyOffers < ActiveRecord::Migration[5.2]
  def change
    create_table :company_offers do |t|
      t.integer :com_id
      t.integer :mem_id
      t.date :senddate
      t.boolean :acc_flag
      t.string :message

      t.timestamps
    end
  end
end
