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
      t.timestamps
    end
  end
end
