class <%= migration_name %> < ActiveRecord::Migration
  def self.up
    create_table :<%= table_name %> do |t|
<% for attribute in attributes -%>
      t.<%= attribute.type %> :<%= attribute.name %>
<% end -%>
      t.boolean :is_visible, :default => true, :null => false
      t.integer :position
      t.timestamps
    end
  end

  def self.down
    drop_table :<%= table_name %>
  end
end
