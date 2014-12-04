class AddAttachmentPictureToAdvertpictures < ActiveRecord::Migration
  def self.up
    change_table :advertpictures do |t|
      t.attachment :picture
    end
  end

  def self.down
    remove_attachment :advertpictures, :picture
  end
end

