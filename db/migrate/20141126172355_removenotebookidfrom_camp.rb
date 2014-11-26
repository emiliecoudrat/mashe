class RemovenotebookidfromCamp < ActiveRecord::Migration
  def change
    remove_column :camps, :notebook_id
  end
end
