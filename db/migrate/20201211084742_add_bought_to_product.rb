class AddBoughtToProduct < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :bought, :boolean
  end
end
