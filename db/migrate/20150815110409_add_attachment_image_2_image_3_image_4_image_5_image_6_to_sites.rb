class AddAttachmentImage2Image3Image4Image5Image6ToSites < ActiveRecord::Migration
  def self.up
    change_table :sites do |t|
      t.attachment :image_2
      t.attachment :image_3
      t.attachment :image_4
      t.attachment :image_5
      t.attachment :image_6
    end
  end

  def self.down
    remove_attachment :sites, :image_2
    remove_attachment :sites, :image_3
    remove_attachment :sites, :image_4
    remove_attachment :sites, :image_5
    remove_attachment :sites, :image_6
  end
end
