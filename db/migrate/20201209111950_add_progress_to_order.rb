class AddProgressToOrder < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :accepted, :boolean
    add_column :orders, :picked, :boolean
  end
end
