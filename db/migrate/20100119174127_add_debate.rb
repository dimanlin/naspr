class AddDebate < ActiveRecord::Migration
  def self.up
  end

  def self.down
    Debate.delete_all
  end
end

