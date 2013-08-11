class Action < ActiveRecord::Base
  belongs_to :unit
  belongs_to :target
  belongs_to :combat
  attr_accessible :action

  # Action constants
  BASIC_ATT = 'basic_attack'
end
