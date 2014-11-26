class CreateCamps < ActiveRecord::Migration
  def change
    create_table :camps do |t|
      t.string :name
      t.string :confidential_code
      t.references :level, index: true
      t.references :school, index: true
      t.references :notebook, index: true

      t.timestamps
    end
  end
end
