class AddAttachmentPictureToAdverts < ActiveRecord::Migration
  def self.up
    # change_table :adverts do |t|
    #   t.attachment :picture
    # end
  end

  def self.down
    remove_attachment :adverts, :picture
  end
end
