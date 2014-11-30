class CreateGuests < ActiveRecord::Migration
  def change
    create_table :guests do |t|
      t.references :event, index: true
      t.references :parent, index: true

      t.timestamps
    end
  end
end
