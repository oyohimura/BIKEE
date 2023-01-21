class RemoveStatusFromRents < ActiveRecord::Migration[7.0]
  def change
    remove_column :rents, :status, :string
  end
end
