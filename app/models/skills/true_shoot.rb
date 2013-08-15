class TrueShoot < BaseSkill
  class << self
    def skill(unit, target)
      unit.do_damage_to(target, 2*Unit::BASE_DMG, unit.default_dmg_type)
    end

    def valid_target?(target)
      target.alive?
    end

    def can_target_self?
      false
    end
  end
end