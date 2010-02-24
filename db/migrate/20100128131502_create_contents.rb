class CreateContents < ActiveRecord::Migration
  def self.up
    create_table :contents do |t|
      t.column :name, :string
      t.column :header, :string
      t.column :text, :text
      t.column :urlname, :string   # when I see in url
      t.column :permalink, :string # were is be
      t.column :title, :string
      t.timestamps
    end
  end

  def self.down
    drop_table :contents
  end
end

