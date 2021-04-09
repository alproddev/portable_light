class CreateHighlightImages < ActiveRecord::Migration
  def self.up
    create_table :highlight_images do |t|
      t.integer :highlight_id

      t.timestamps
    end
  end

  def self.down
    drop_table :highlight_images
  end
end
