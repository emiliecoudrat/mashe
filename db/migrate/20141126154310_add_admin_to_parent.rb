class AddAdminToParent < ActiveRecord::Migration
  def change
    add_column :parents, :admin, :boolean
  end
end
