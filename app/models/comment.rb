class Comment < ActiveRecord::Base

  belongs_to :debate
  belongs_to :user

  validates_presence_of :message
  validates_inclusion_of :voted, :in => [true, false]


  def ansver
    case self.voted
      when true
        "Против"
      when false
        "За"
    end
  end
end

