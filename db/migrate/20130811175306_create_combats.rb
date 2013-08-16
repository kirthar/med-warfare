class CreateCombats < ActiveRecord::Migration
  def change
    create_table :combats do |t|
      t.string :status
      t.timestamps
    end
  end
end
