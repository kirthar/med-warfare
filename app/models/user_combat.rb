class UserCombat < ActiveRecord::Base
  attr_accessible :user, :combat
  belongs_to :combat
  belongs_to :user
end
