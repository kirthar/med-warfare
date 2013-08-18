class AddMissingIndexes < ActiveRecord::Migration
  def change
    add_index :units, [:id, :type]
  end
end