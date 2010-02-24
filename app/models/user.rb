class User < ActiveRecord::Base

  validates_presence_of :nick
  validates_uniqueness_of :nick

  xss_terminate :html5lib_sanitize => [:nick]

  has_attached_file :avatar, :styles => { :original => "83x83>" }

  has_many :debates
  has_many :comments

  acts_as_authentic do |c|
    c.crypto_provider = Authlogic::CryptoProviders::Sha1
    c.email_field :login
  end # the configuration block is optional

  def user_avatar
    if self.user
      if self.user.avatar_file_name
        lastdebate.user.avatar.url(:thumb)
      else
        File.join("avatar2.jpg")
      end
    else
      File.join("avatar2.jpg")
    end
  end

end

