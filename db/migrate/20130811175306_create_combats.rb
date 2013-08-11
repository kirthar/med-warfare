class CreateCombats < ActiveRecord::Migration
  def change
    create_table :combats do |t|

      t.timestamps
    end
  end
end
