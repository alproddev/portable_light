class CreatePosts < ActiveRecord::Migration
  def self.up
    create_table :posts do |t|

      t.string :title

      t.text :intro

      t.text :body

      t.boolean :is_visible, :default => 0, :null => false
      t.integer :position
      t.timestamps
    end
  end

  def self.down
    drop_table :posts
  end
end
