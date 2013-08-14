class CreateUnits < ActiveRecord::Migration
  def change
    create_table :units do |t|
      t.string :name
      t.string :description
      t.string :type
      t.integer :level, default: 1
      t.integer :experience, default: 0
      t.integer :max_health, default: 13
      t.integer :current_health, default: 13
      t.string :status
      t.references :user
      t.timestamps
    end
    add_index :units, :unit_id
  end
end
