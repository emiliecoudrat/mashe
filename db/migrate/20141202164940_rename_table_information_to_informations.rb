class RenameTableInformationToInformations < ActiveRecord::Migration
 def change
        rename_table :information, :informations
    end
 end
