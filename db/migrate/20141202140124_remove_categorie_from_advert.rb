class RemoveCategorieFromAdvert < ActiveRecord::Migration
  def change
    remove_column :adverts, :categorie
  end
end
