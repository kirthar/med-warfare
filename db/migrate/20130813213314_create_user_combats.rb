class CreateUserCombats < ActiveRecord::Migration
  def change
    create_table :user_combats do |t|
      t.references :user
      t.references :combat
      t.string :challange_state
      t.timestamps
    end
    add_index :user_combats, :user_id
    add_index :user_combats, :combat_id
  end
end
