class Content < ActiveRecord::Base
  validates_presence_of :header, :name, :text, :urlname, :permalink, :title
end

