class AddCaptionToHighlightImages < ActiveRecord::Migration
  def self.up
    add_column :highlight_images, :caption, :string
  end

  def self.down
    remove_column :highlight_images, :caption
  end
end
