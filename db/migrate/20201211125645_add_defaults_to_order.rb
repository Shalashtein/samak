class AddDefaultsToOrder < ActiveRecord::Migration[6.0]
  def change
    change_column :orders, :accepted, :boolean, default: false
    change_column :orders, :picked, :boolean, default: false
    change_column :orders, :done, :boolean, default: false
    change_column :products, :done, :boolean, default: false
    change_column :products, :bought, :boolean, default: false
  end
end
