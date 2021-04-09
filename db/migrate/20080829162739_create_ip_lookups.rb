class CreateIpLookups < ActiveRecord::Migration
  def self.up
    create_table :ip_lookups do |t|
      t.text :env
      t.text :response
      t.string :city
      t.string :state
      t.string :country
      t.string :postal_code
      t.string :lat
      t.string :lng
      t.string :coordinates
      t.timestamps
    end
  end

  def self.down
    drop_table :ip_lookups
  end
end
