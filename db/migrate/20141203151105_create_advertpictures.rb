class CreateAdvertpictures < ActiveRecord::Migration
  def change
    create_table :advertpictures do |t|

      t.timestamps
    end
  end
end
