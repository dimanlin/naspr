class Debate < ActiveRecord::Base

  attr_accessor :rules

  validates_presence_of :header, :message
  validates_inclusion_of :rules, :in => [true, "1"], :message => "Вы должны быть согласны с правилами сервиса."

  belongs_to :user
  has_many :comments



  def num_ansver_true
    self.comments.find(:all, :conditions => ["voted = ?", true]).size
  end

  def num_ansver_false
    self.comments.find(:all, :conditions => ["voted = ?", false]).size
  end

end

