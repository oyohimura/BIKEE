class CreateBikes < ActiveRecord::Migration[7.0]
  def change
    create_table :bikes do |t|
      t.string :brand
      t.string :model
      t.float :price
      t.string :location
      t.boolean :electric
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
