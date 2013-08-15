class Resurrect < BaseSkill
  class << self
    def skill(unit, target)
      unit.do_damage_to(target, target.current_health + Unit::BASE_DMG, Unit::DMG_TYPE_HEAL)
    end

    def valid_target?(target)
      target.dead?
    end
  end
end