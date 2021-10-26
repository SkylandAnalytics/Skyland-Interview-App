class CreateParameter < ActiveRecord::Migration[6.0]
  def change
    create_table :parameters do |t|
      t.integer :measurement
      t.references :process_step
    end
  end
end
