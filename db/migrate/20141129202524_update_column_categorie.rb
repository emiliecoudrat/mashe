class UpdateColumnCategorie < ActiveRecord::Migration
  def change
    rename_column :adverts, :category, :categorie
  end
end
