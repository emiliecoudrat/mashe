class CreateScholarships < ActiveRecord::Migration
  def change
    create_table :scholarships do |t|
      t.integer :year
      t.references :camp, index: true
      t.references :kid, index: true

      t.timestamps
    end
  end
end
