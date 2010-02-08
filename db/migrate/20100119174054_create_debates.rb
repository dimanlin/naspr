class CreateDebates < ActiveRecord::Migration
  def self.up
    create_table :debates do |t|
      t.column :header, :string
      t.column :user_id, :integer
      t.column :message, :text
      t.column :alert, :boolean, :default => false
      t.column :check, :boolean, :default => false
      t.timestamps
    end
  end

  def self.down
    drop_table :debates
  end
end

