class UpdateColumnTransaction < ActiveRecord::Migration
  def change
    rename_column :adverts, :transaction_types, :transaction_type
  end
end
