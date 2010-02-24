class AddUser < ActiveRecord::Migration
  def self.up
    User.create(:nick => "administrator", :login => "devandart@ya.ru", :password => "root00", :password_confirmation => "root00", :master => true)
    User.create(:nick => "user", :login => "user@ya.ru", :password => "root00", :password_confirmation => "root00")
  end

  def self.down
    User.delete_all
  end
end

