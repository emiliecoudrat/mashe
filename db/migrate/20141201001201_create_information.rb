class CreateInformation < ActiveRecord::Migration
  def change
    create_table :information do |t|
      t.string :name
      t.string :content
      t.string :categorie
      t.datetime :end_date
      t.references :camp, index: true
      t.references :parent, index: true

      t.timestamps
    end
  end
end
