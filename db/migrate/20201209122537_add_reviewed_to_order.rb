class AddReviewedToOrder < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :reviewed, :boolean
  end
end
