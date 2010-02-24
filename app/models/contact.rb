class Contact < ActiveRecord::Base
  validates_presence_of :from, :email, :message
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create

  xss_terminate :html5lib_sanitize => [:from, :email, :mssages]
end

