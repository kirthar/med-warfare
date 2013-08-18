class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessor :login
  attr_accessible :username, :email, :password, :password_confirmation, :remember_me, :login, :admin

  has_many :units
  has_many :user_combats
  has_many :combats, :through => :user_combats

  scope :excluding_ids, lambda { |ids|
    where(['id NOT IN (?)', ids]) if ids.any?
  }

  validates :username, :uniqueness => {:case_sensitive => false}

  def fights?(combat)
    combats.include?(combat)
  end

  def challange(combat)
    UserCombat.find_by_combat_id_and_user_id(combat.id, id)
  end

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      where(conditions).first
    end
  end

end
