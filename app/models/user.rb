class User < ActiveRecord::Base
  has_many :locations
  has_many :restaurants, through: :locations
  has_many :items, through: :restaurants

  has_secure_password

  validates :username, presence: true
  validates :username, uniqueness: true
  validates :password, presence: true

  def self.from_omniauth(auth)
   where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
     user.email = auth.info.email
     user.uid = auth.uid
     user.provider = auth.provider
     user.avatar_url = auth.info.image
     user.username = auth.info.name
     user.oauth_token = auth.credentials.token
     user.password = SecureRandom.hex
     user.save!
   end
 end
end
