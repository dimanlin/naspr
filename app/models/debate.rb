class Debate < ActiveRecord::Base

  attr_accessor :rules

  validates_presence_of :header, :message
  validates_inclusion_of :rules, :in => [true, "1"], :on => :create, :message => "Вы должны быть согласны с правилами сервиса."

  belongs_to :user
  has_many :comments

  xss_terminate :html5lib_sanitize => [:header, :message]

  define_index do
    indexes header, :sortable => true
  end

  def user_avatar
    if self.user
      if self.user.avatar_file_name
        self.user.avatar.url(:original)
      else
        File.join("avatar2.jpg")
      end
    else
      File.join("avatar2.jpg")
    end
  end

  def num_ansver_true
    self.comments.find(:all, :conditions => ["voted = ?", true]).size
  end

  def num_ansver_false
    self.comments.find(:all, :conditions => ["voted = ?", false]).size
  end
end

