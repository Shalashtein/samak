class AddCookingToFish < ActiveRecord::Migration[6.0]
  def change
    add_column :fish, :bake, :boolean
    add_column :fish, :broil, :boolean
    add_column :fish, :fry, :boolean
    add_column :fish, :grill, :boolean
    add_column :fish, :poach, :boolean
    add_column :fish, :saute, :boolean
    add_column :fish, :smoke, :boolean
    add_column :fish, :steam, :boolean
    add_column :fish, :sushi, :boolean
    add_column :fish, :cooking, :boolean
  end
end
