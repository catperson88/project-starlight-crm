class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.string :name, null: false
      t.string :address, null:false
      t.string :city, null: false
      t.string :state, null: false
      t.integer :zip, null: false
      t.text :description
      
      t.timestamps
    end
  end
end
