class ChangeMeasurement < ActiveRecord::Migration[6.0]
  def change
    remove_column :parameters, :measurement, :integer
    add_column :parameters, :measurement, :float
  end
end
