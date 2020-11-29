class CreateFish < ActiveRecord::Migration[6.0]
  def change
    create_table :fish do |t|
      t.string :scientific
      t.string :english
      t.string :lebanese
      t.string :water
      t.string :texture
      t.string :flavor
      t.string :image

      t.timestamps
    end
  end
end
