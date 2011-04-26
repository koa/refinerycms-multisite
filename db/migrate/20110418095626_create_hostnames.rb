class CreateHostnames < ActiveRecord::Migration
  def self.up
    create_table :hostnames do |t|
      t.string :hostname
      t.integer :site_id
      t.timestamps
    end
  end

  def self.down
    drop_table :hostnames
  end
end
