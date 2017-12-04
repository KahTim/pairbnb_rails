class User < ApplicationRecord
  include Clearance::User

  # include Clearance::User

  has_many :authentications, dependent: :destroy
  mount_uploader :avatar, AvatarUploader
  has_many :listings, dependent: :destroy
  has_many :reservations
   

  def self.create_with_auth_and_hash(authentication, auth_hash)
    user = self.create!(
      name: auth_hash["extra"]["raw_info"]["name"],
      email: auth_hash["extra"]["raw_info"]["email"],
      password: SecureRandom.hex(5) 
      # rand(36**9).to_s(36)
    )
    user.authentications << authentication
    return user
  end

  # grab fb_token to access Facebook for user data
  def fb_token
    x = self.authentications.find_by(provider: 'facebook')
    return x.token unless x.nil?
  end

end
