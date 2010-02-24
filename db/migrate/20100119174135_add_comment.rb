class AddComment < ActiveRecord::Migration
  def self.up
  end

  def self.down
    User.delete_all
  end
end

