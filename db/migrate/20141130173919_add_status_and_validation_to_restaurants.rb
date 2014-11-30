class AddStatusAndValidationToRestaurants < ActiveRecord::Migration
  def change
    add_column :schools, :status, :string
    add_column :schools, :validation, :boolean
  end
end
