class Combat < ActiveRecord::Base
  has_many :combat_actions
  has_many :user_combats
  has_many :users, :through => :user_combats
  has_many :units, :through => :users

  def all_dead?(units)
    not units.any? { |unit| unit.alive? }
  end
end
