class UserSocialLogin < ActiveRecord::Base
  belongs_to :user
  attr_accessible :user, :provider, :uid
end
