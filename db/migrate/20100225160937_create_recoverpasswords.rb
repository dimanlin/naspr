class CreateRecoverpasswords < ActiveRecord::Migration
  def self.up
    create_table :recoverpasswords do |t|
      t.column :user_id, :integer
      t.column :key, :string
      t.timestamps
    end
  end

  def self.down
    drop_table :recoverpasswords
  end
end

