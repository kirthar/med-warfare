class CreateUnitImages < ActiveRecord::Migration
  def change
    create_table :unit_images do |t|
      t.string  :image
      t.integer :unit_id
      t.integer :order

      t.timestamps
    end
  end
end
