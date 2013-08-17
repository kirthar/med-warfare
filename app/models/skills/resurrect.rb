module Skills
  class Resurrect < BaseSkill
    class << self
      def skill(unit, target)
        unit.do_damage_to(target, -1 * target.current_health + Unit::BASE_DMG, Unit::DMG_TYPE_RESURRECT)
      end

      def valid_target?(target)
        target.dead?
      end

      def can_target_self?
        false
      end
    end
  end
end