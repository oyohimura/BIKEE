class AddStatusToRents < ActiveRecord::Migration[7.0]
  def change
    add_column :rents, :status, :integer, default: 0
  end
end
