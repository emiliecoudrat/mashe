class UpdateColumnAdvert < ActiveRecord::Migration
  def change
    rename_column :advert, :transaction, :transac
  end
end
