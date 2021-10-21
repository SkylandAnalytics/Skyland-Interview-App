class CreateParameters < ActiveRecord::Migration[6.0]
  def change
    create_table :parameters do |t|
      t.float :measurement
      t.references :process_step, null: false, foreign_key: true

      t.timestamps
    end
  end
end
