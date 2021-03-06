class CreateAdverts < ActiveRecord::Migration
  def change
    create_table :adverts do |t|
      t.string :title
      t.text :description
      t.string :categorie
      t.string :transaction_type
      t.integer :price_cents
      t.boolean :published
      t.boolean :sold
      t.references :parent, index: true
      t.references :school, index: true

      t.timestamps
    end
  end
end
