class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  devise :omniauthable, :omniauth_providers => [:facebook, :google_oauth2]

  attr_accessor :login
  attr_accessible :username, :email, :password, :password_confirmation, :remember_me, :login, :admin, :uid, :provider
  has_many :units
  has_many :user_combats
  has_many :combats, :through => :user_combats

  has_many :user_social_logins

  has_many :friendships
  has_many :friends, :through => :friendships
  has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
  has_many :inverse_friends, :through => :inverse_friendships, :source => :user

  scope :excluding_ids, lambda { |ids|
    where(['id NOT IN (?)', ids]) if ids.any?
  }

  validates :username, :uniqueness => {:case_sensitive => false}

  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    user_login = UserSocialLogin.where(provider: auth.provider, uid: auth.uid)

    return user_login.first.user unless user_login.nil?

    unless user = User.find_by_email(auth.info.email)
      user = User.create(username:auth.extra.raw_info.name,
                         provider:auth.provider,
                         uid:auth.uid,
                         email:auth.info.email,
                         password:Devise.friendly_token[0,20]
      )
    end
    user.user_social_logins.build(provider: auth.provider, uid: auth.uid )
    user
  end

  def self.find_for_google_oauth2(auth, signed_in_resource=nil)
    data = auth.info
    user = User.where(:email => data["email"]).first
    return user if user and user.user_social_logins.any?

    unless user
      user = User.create(username: data["name"],
                         email: data["email"],
                         password: Devise.friendly_token[0,20]
      )
    end
    user.user_social_logins.build(provider: auth.provider, uid: auth.uid )
    user
  end

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      where(conditions).first
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end


  def fights?(combat)
    combats.include?(combat)
  end

  def challange(combat)
    UserCombat.find_by_combat_id_and_user_id(combat.id, id)
  end

end
