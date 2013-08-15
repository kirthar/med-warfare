class MagicMissile < BaseSkill
  class << self
    def skill(unit, target)
      unit.do_damage_to(target, Unit::MAGIC_DMG, Unit::DMG_TYPE_MAGIC)
    end

    def friendly_fire?
      false
    end
  end
end