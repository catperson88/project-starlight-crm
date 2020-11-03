class CreateDeals < ActiveRecord::Migration[5.2]
  def change
    create_table :deals do |t|
      t.string :deal_name, null: false
      t.integer :value, null:false
      t.integer :discount_percentage
      t.text :description

      t.timestamps
    end
  end
end
