class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :product_name, null: false
      t.string :product_value, null:false
      t.string :product_description, null:false 

      t.timestamps
    end
  end
end
