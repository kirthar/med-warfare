class CreateUnits < ActiveRecord::Migration
  def change
    create_table :units do |t|
      t.string :name
      t.string :description
      t.string :type
      t.integer :level
      t.integer :experience
      t.integer :max_health
      t.integer :current_health
      t.string :status
      t.references :user
      t.timestamps
    end
    add_index :units, :unit_id
  end
end
