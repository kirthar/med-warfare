class CreateCombats < ActiveRecord::Migration
  def change
    create_table :combats do |t|
      t.references :current_unit
      t.string :status
      t.timestamps
    end
  end
end
