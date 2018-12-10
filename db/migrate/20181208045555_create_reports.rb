class CreateReports < ActiveRecord::Migration[5.2]
  def change
    create_table :reports do |t|
      t.integer :report_chat
      t.integer :reported_man
      t.integer :report_man

      t.timestamps
    end
  end
end
