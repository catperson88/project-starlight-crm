class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.string :first_name
      t.string :last_name, null: false
      t.string :title
      t.string :linkedin_URL
      t.string :phone
      t.string :email_address 
      t.text :notes

      t.belongs_to :company

      t.timestamps
    end
  end
end
