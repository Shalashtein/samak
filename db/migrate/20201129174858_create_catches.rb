class CreateCatches < ActiveRecord::Migration[6.0]
  def change
    create_table :catches do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :fish, null: false, foreign_key: true
      t.integer :weight

      t.timestamps
    end
  end
end
