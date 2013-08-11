class CreateActions < ActiveRecord::Migration
  def change
    create_table :actions do |t|
      t.references :unit
      t.references :target
      t.references :combat
      t.string :action

      t.timestamps
    end
    add_index :actions, :unit_id
    add_index :actions, :target_id
    add_index :actions, :combat_id
  end
end
