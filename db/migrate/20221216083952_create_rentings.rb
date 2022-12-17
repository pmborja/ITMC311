class CreateRentings < ActiveRecord::Migration[7.0]
  def change
    create_table :rentings do |t|
      t.date :start_date
      t.date :end_date
      t.integer :user_id
      t.integer :posting_id

      t.timestamps
    end
  end
end
