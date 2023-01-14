class CreateRents < ActiveRecord::Migration[7.0]
  def change
    create_table :rents do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.float :rent_price
      t.string :status

      t.timestamps
    end
  end
end
