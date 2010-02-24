class CreateContacts < ActiveRecord::Migration
  def self.up
    create_table :contacts do |t|
      t.column :from, :string
      t.column :email, :string
      t.column :message, :text
      t.timestamps
    end
  end

  def self.down
    drop_table :contacts
  end
end

