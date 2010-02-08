class AddComment < ActiveRecord::Migration
  def self.up
    users = User.find(:all)
    debates = Debate.find(:all)
    users.each {|user|
      debates.each {|debate|
        if debate.user != user
          Comment.create(:user_id => user.id, :debate_id => debate.id, :message => "Я пользователь #{user.login}", :voted => rand(2));
        end
      }
    }
  end

  def self.down
    User.delete_all
  end
end

