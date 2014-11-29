class UpdateColumnTransac < ActiveRecord::Migration
  def change
  rename_column :adverts, :transac, :transaction_types
  end
end
