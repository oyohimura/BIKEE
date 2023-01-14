class AddReferencesToRents < ActiveRecord::Migration[7.0]
  def change
    add_reference :rents, :user, foreign_key: true
    add_reference :rents, :bike, foreign_key: true
  end
end
