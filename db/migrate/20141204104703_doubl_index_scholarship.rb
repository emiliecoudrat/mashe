class DoublIndexScholarship < ActiveRecord::Migration
  def change
    add_index :scholarships, [:kid_id, :camp_id]
  end
end
