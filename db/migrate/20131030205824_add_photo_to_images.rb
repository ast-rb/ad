class AddPhotoToImages < ActiveRecord::Migration
  def self.up
    add_column :images, :photo, :string
  end

  def self.down
    remove_column :images, :photo
  end
end
