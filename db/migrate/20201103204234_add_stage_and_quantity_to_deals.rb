class AddStageAndQuantityToDeals < ActiveRecord::Migration[5.2]
  def change
    add_column :deals, :stage, :string, null: false
    add_column :deals, :quantity, :integer
  end
end
