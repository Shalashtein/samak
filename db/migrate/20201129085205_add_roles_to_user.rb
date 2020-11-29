class AddRolesToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :admin, :boolean, default: false
    add_column :users, :fisherman, :boolean, default: false
    add_column :users, :consumer, :boolean, default: true
  end
end
