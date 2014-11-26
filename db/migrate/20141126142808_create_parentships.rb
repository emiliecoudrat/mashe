class CreateParentships < ActiveRecord::Migration
  def change
    create_table :parentships do |t|
      t.references :kid, index: true
      t.references :parent, index: true

      t.timestamps
    end
  end
end
