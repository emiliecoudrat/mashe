class AddStatusColumnToParentships < ActiveRecord::Migration
  def change
    add_column :parentships, :status, :string
  end
end
