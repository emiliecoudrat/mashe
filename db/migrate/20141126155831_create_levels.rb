class CreateLevels < ActiveRecord::Migration
  def change
    create_table :levels do |t|
      t.string :name
      t.references :school, index: true

      t.timestamps
    end
  end
end
