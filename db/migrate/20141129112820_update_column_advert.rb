class UpdateColumnAdvert < ActiveRecord::Migration
  def change
    rename_column :adverts, :transaction, :transac
  end
end
