class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.column :user_id, :integer
      t.column :debate_id, :integer
      t.column :message, :text
      t.column :voted, :boolean # Если 0 то за, если 1 против
      t.column :check, :boolean, :default => false
      t.timestamps
    end
  end

  def self.down
    drop_table :comments
  end
end

