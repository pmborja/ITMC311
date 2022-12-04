class CreatePostings < ActiveRecord::Migration[7.0]
  def change
    create_table :postings do |t|
      t.string :property_name
      t.string :address
      t.string :rent_per_month
      t.string :service_charge
      t.string :additional_charges
      t.string :security_deposit
      t.string :property_size
      t.string :property_type
      t.string :rooms
      t.string :other_details
      t.string :inclusions

      t.timestamps
    end
  end
end
