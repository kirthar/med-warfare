class Combat < ActiveRecord::Base
  has_many :combat_actions
  has_many :user_combats
  has_many :users, :through => :user_combats
end
