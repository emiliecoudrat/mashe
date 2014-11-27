class AddColToParent < ActiveRecord::Migration
  def change
    add_column :parents, :title, :string
    add_column :parents, :first_name, :string
    add_column :parents, :last_name, :string
    add_column :parents, :phone_number, :string
  end
end

