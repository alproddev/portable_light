class AddAttachmentsFileToHighlightImage < ActiveRecord::Migration
  def self.up
    add_column :highlight_images, :file_file_name, :string
    add_column :highlight_images, :file_content_type, :string
    add_column :highlight_images, :file_file_size, :integer
    add_column :highlight_images, :file_updated_at, :datetime
  end

  def self.down
    remove_column :highlight_images, :file_file_name
    remove_column :highlight_images, :file_content_type
    remove_column :highlight_images, :file_file_size
    remove_column :highlight_images, :file_updated_at
  end
end
