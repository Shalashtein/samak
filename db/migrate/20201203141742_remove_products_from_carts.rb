class RemoveProductsFromCarts < ActiveRecord::Migration[6.0]
  def change
    remove_reference :carts, :products, null: false, foreign_key: true
    add_reference :carts, :items, null: true, foreign_key: true
  end
end
