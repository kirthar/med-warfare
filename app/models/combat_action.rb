class CombatAction < ActiveRecord::Base

  serialize :result, JSON

  belongs_to :combat
  belongs_to :unit,   class_name: 'Unit', foreign_key: "unit_id"
  belongs_to :target, class_name: 'Unit', foreign_key: "target_id"

  scope :newest_first, order(arel_table[:created_at].desc)
  scope :oldest_first, order(arel_table[:created_at])

  attr_accessible :unit_id, :target_id, :combat_id, :action, :unit, :target, :combat, :result

  validates :unit_id, presence: true
  validates :action, presence: true

  # Action constants
  BASIC_ATT = 'basic_attack'
  DEFENSE = 'defense'
  MAGIC_ATT = 'magic_attack'

  ACTIONS = [BASIC_ATT, DEFENSE, MAGIC_ATT]

end
