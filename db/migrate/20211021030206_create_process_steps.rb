class CreateProcessSteps < ActiveRecord::Migration[6.0]
  def change
    create_table :process_steps do |t|
      t.string :name
      t.text :description
      t.integer :position

      t.timestamps
    end
  end
end
