class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me

  has_many :units
  has_many :user_combats
  has_many :combats, :through => :user_combats

  scope :excluding_ids, lambda { |ids|
    where(['id NOT IN (?)', ids]) if ids.any?
  }

  def fights?(combat)
    combats.include?(combat)
  end

  def challange(combat)
    UserCombat.find_by_combat_id_and_user_id(combat.id, id)
  end

end
