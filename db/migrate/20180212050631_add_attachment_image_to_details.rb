 class AddAttachmentImageToDetails < ActiveRecord::Migration[5.1]
  def self.up
    change_table :details do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :details, :image
  end
end
