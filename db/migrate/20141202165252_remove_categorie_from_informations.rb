class RemoveCategorieFromInformations < ActiveRecord::Migration
  def change
    remove_column :informations, :categorie
  end
end
