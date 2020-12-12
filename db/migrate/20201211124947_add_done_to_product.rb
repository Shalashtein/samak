class AddDoneToProduct < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :done, :boolean
  end
end
