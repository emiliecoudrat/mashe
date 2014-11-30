class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.references :parent, index: true

      t.timestamps
    end
  end
end
