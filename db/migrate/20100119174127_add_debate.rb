class AddDebate < ActiveRecord::Migration
  def self.up
    users = User.find(:all)
    users.each {|user|
      2.times {|i|
        Debate.create(:header => "Кто лудше, я или он?_#{i}", :message => "Он такой растакой а я такой никакой что мне делать как мне жить?_#{i}", :user_id => user.id, :rules => true)
      }
    }
  end

  def self.down
    Debate.delete_all
  end
end

