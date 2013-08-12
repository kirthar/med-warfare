class CreateUnitImages < ActiveRecord::Migration
  def change
    create_table :unit_images do |t|
      t.string  :image
      t.references :unit
      t.integer :order

      t.timestamps
    end
    add_index :unit_images, :unit_id
  end
end
