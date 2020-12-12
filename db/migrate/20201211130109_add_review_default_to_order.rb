class AddReviewDefaultToOrder < ActiveRecord::Migration[6.0]
  def change
    change_column :orders, :reviewed, :boolean, default: false
  end
end
