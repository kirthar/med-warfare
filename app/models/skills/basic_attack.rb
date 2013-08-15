class BasicAttack < BaseSkill
  class << self
    def skill(unit, target)
      unit.do_damage_to(target, Unit::BASE_DMG, unit.default_dmg_type)
    end
  end
end