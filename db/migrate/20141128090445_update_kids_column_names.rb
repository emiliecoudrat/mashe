class UpdateKidsColumnNames < ActiveRecord::Migration
  def change
    rename_column :kids, :firstname, :first_name
    rename_column :kids, :lastname, :last_name
  end
end
