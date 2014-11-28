class MoveScholarshipYearToCamp < ActiveRecord::Migration
  def change
    remove_column :scholarships, :year
    add_column :camps, :year, :string
  end
end
