class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.string :content
      t.integer :rating
      t.references :reviewer
      t.references :fisherman

      t.timestamps
    end
    add_foreign_key :reviews, :users, column: :reviewer_id, primary_key: :id
    add_foreign_key :reviews, :users, column: :fisherman_id, primary_key: :id
  end
end
