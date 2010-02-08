class User < ActiveRecord::Base

  validates_presence_of :nick
  validates_uniqueness_of :nick

  has_attached_file :avatar, :styles => { :original => "83x83>" }

  has_many :debates
  has_many :comments

  acts_as_authentic do |c|
    c.crypto_provider = Authlogic::CryptoProviders::Sha1
    c.email_field :login
  end # the configuration block is optional
end

