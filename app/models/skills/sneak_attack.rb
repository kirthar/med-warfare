module Skills
  class SneakAttack < BaseSkill
    class << self
      def skill(unit, target)
        unit.do_damage_to(target, 4*Unit::BASE_DMG, unit.default_dmg_type)
      end
    end
  end
end