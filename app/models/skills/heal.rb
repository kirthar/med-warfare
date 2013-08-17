module Skills
  class Heal < BaseSkill
    class << self
      def skill(unit, target)
        unit.do_damage_to(target, Unit::BASE_DMG, Unit::DMG_TYPE_HEAL)
      end

      def enemy_fire?
        false
      end
    end
  end
end