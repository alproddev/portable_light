class CreateHighlights < ActiveRecord::Migration
  def self.up
    create_table :highlights do |t|
      t.string :title
      t.text :body
      t.text :related_links
      t.boolean :is_visible, :default => 0, :null => false
      t.integer :position
      t.timestamps
    end
  end

  def self.down
    drop_table :highlights
  end
end
