class Activities < ActiveRecord::Migration[5.2]
  def change
    create_table :activities do |t|
      t.string :type, null: false
      t.string :title, null: false
      t.text :notes, null: false

      t.belongs_to :company
      t.belongs_to :contact
      t.belongs_to :deal

      t.timestamps
    end
  end
end
