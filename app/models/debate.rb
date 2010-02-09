class Debate < ActiveRecord::Base

  attr_accessor :rules

#  cattr_reader :per_page
#  @@per_page = 20

  validates_presence_of :header, :message
  validates_inclusion_of :rules, :in => [true, "1"], :message => "Вы должны быть согласны с правилами сервиса."

  belongs_to :user
  has_many :comments

  define_index do
    # fields
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

