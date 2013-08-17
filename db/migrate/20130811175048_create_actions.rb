class CreateActions < ActiveRecord::Migration
  def change
    create_table :combat_actions do |t|
      t.references :unit
      t.references :target
      t.references :combat
      t.string     :action
      t.string     :result

      t.timestamps
    end
    add_index :combat_actions, :unit_id
    add_index :combat_actions, :target_id
    add_index :combat_actions, :combat_id
  end
end
