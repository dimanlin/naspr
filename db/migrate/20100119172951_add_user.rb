class AddUser < ActiveRecord::Migration
  def self.up

      User.create(:nick => "administrator", :login => "devandart@ya.ru", :password => "root00", :password_confirmation => "root00", :master => true)

    50.times {|i|
      User.create(:nick => "nickname_#{i}", :login => "user#{i}@ya.ru", :password => "root00", :password_confirmation => "root00")
    }
  end

  def self.down
    User.delete_all
  end
end

